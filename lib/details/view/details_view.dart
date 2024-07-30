import 'package:catbreeds/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_api/user_api.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cat = context.select<DetailsCubit, Cat>((cubit) => cubit.state.cat);

    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatImageDetails(),
            SizedBox(height: 20),
            CatTextDetails(),
          ],
        ),
      ),
    );
  }
}

class CatImageDetails extends StatelessWidget {
  const CatImageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 300,
          child: FutureBuilder<String>(
            future: context.read<DetailsCubit>().getCatImage(
                  state.cat.reference_image_id,
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
        );
      },
    );
  }
}

class CatTextDetails extends StatelessWidget {
  const CatTextDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) => Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.cat.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Peso en libras',
                value: state.cat.weight.imperial,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Peso en kilogramos',
                value: state.cat.weight.metric,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'URL de la CFA',
                value: state.cat.cfa_url,
                isLink: true,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'URL de la Vetstreet',
                value: state.cat.vetstreet_url,
                isLink: true,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'URL de la VCA Hospitals',
                value: state.cat.vcahospitals_url,
                isLink: true,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Temperamento',
                value: state.cat.temperament,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Origen',
                value: state.cat.origin,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Códigos de país',
                value: state.cat.country_codes,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Código de país',
                value: state.cat.country_code,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Esperanza de vida',
                value: state.cat.life_span,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es un gato de interior?',
                value: state.cat.indoor == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es un gato de regazo?',
                value: state.cat.lap == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Adaptabilidad',
                value: state.cat.adaptability.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Nivel de afecto',
                value: state.cat.affection_level.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es amigable con los niños?',
                value: state.cat.child_friendly == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es amigable con los gatos?',
                value: state.cat.cat_friendly == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es amigable con los perros?',
                value: state.cat.dog_friendly == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Nivel de energía',
                value: state.cat.energy_level.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Cuidado del pelaje',
                value: state.cat.grooming.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Problemas de salud',
                value: state.cat.health_issues.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Inteligencia',
                value: state.cat.intelligence.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Nivel de muda',
                value: state.cat.shedding_level.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Necesidades sociales',
                value: state.cat.social_needs.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es amigable con los extraños?',
                value: state.cat.stranger_friendly == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Vocalización',
                value: state.cat.vocalisation.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'Adiestrabilidad',
                value: state.cat.bidability.toString(),
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es un gato experimental?',
                value: state.cat.experimental == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es un gato sin pelo?',
                value: state.cat.hairless == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es un gato natural?',
                value: state.cat.natural == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es un gato raro?',
                value: state.cat.rare == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es un gato rex?',
                value: state.cat.rex == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Tiene la cola suprimida?',
                value: state.cat.suppressed_tail == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Tiene las patas cortas?',
                value: state.cat.short_legs == 1 ? 'Sí' : 'No',
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: 'URL de Wikipedia',
                value: state.cat.wikipedia_url,
                isLink: true,
              ),
              const SizedBox(height: 10),
              SingleItemDetails(
                title: '¿Es hipoalergénico?',
                value: state.cat.hypoallergenic == 1 ? 'Sí' : 'No',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleItemDetails extends StatelessWidget {
  const SingleItemDetails({
    required this.title,
    required this.value,
    this.isLink = false,
    super.key,
  });

  final String title;
  final String value;
  final bool isLink;

  @override
  Widget build(BuildContext context) {
    return isLink
        ? GestureDetector(
            onTap: value.isEmpty ? () {} : () => launchUrl(Uri.parse(value)),
            child: RichText(
              text: TextSpan(
                text: '$title: ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
                children: const [
                  TextSpan(
                    text: 'Abrir enlace',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          )
        : RichText(
            text: TextSpan(
              text: '$title: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
  }
}
