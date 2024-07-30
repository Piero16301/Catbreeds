import 'package:catbreeds/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_api/user_api.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados de la búsqueda'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextNameSearch(),
            SizedBox(height: 10),
            CatsResultsSearch(),
          ],
        ),
      ),
    );
  }
}

class TextNameSearch extends StatelessWidget {
  const TextNameSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final name =
        context.select<SearchCubit, String>((cubit) => cubit.state.name);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RichText(
        text: TextSpan(
          text: 'Resultados para: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
          children: [
            TextSpan(
              text: name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CatsResultsSearch extends StatelessWidget {
  const CatsResultsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.status.isSuccess) {
          if (state.cats.isEmpty) {
            return const Expanded(
              child: Center(child: Text('No se encontraron gatos')),
            );
          }
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.cats.length,
              itemBuilder: (context, index) {
                final cat = state.cats[index];
                return CatCardSearch(cat: cat);
              },
            ),
          );
        } else {
          return const Expanded(
            child: Center(child: Text('No se encontraron gatos')),
          );
        }
      },
    );
  }
}

class CatCardSearch extends StatelessWidget {
  const CatCardSearch({
    required this.cat,
    super.key,
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    final name = context.select<SearchCubit, String>(
      (cubit) => cubit.state.name,
    );

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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                  onPressed: () => context.goNamed(
                    'search-details',
                    pathParameters: {
                      'name': name,
                    },
                    extra: cat,
                  ),
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
                future: context.read<SearchCubit>().getCatImage(
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
