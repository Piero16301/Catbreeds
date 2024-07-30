import 'package:catbreeds/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_api/user_api.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SearchBarHome(),
            SizedBox(height: 10),
            CatsResultsHome(),
          ],
        ),
      ),
    );
  }
}

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) => SearchBar(
        controller: controller,
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 10),
        ),
        elevation: const WidgetStatePropertyAll<double>(0),
        onSubmitted: (value) {
          debugPrint(value);
        },
        hintText: 'Buscar gato',
        keyboardType: TextInputType.text,
        leading: const Icon(Icons.search),
        trailing: [
          Tooltip(
            message: 'Limpiar',
            child: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                controller.clear();
              },
            ),
          ),
        ],
      ),
      suggestionsBuilder: (context, controller) => [const SizedBox.shrink()],
    );
  }
}

class CatsResultsHome extends StatefulWidget {
  const CatsResultsHome({super.key});

  @override
  State<CatsResultsHome> createState() => _CatsResultsHomeState();
}

class _CatsResultsHomeState extends State<CatsResultsHome> {
  static const _pageSize = 10;

  final PagingController<int, Cat> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await context.read<HomeCubit>().getCats(
            pageKey,
            _pageSize,
          );
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => Future.sync(_pagingController.refresh),
        child: PagedListView<int, Cat>(
          pagingController: _pagingController,
          physics: const AlwaysScrollableScrollPhysics(),
          builderDelegate: PagedChildBuilderDelegate<Cat>(
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('No se encontraron gatos'),
            ),
            itemBuilder: (context, cat, index) => CatCardHome(cat: cat),
          ),
        ),
      ),
    );
  }
}

class CatCardHome extends StatelessWidget {
  const CatCardHome({
    required this.cat,
    super.key,
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Raza: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: cat.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Ver más',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: FutureBuilder<String>(
                future: context.read<HomeCubit>().getCatImage(
                      cat.reference_image_id,
                    ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'País: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: cat.country_code,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Inteligencia: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: cat.intelligence.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
