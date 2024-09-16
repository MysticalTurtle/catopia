import 'package:cached_network_image/cached_network_image.dart';
import 'package:catopia/domain/entities/cat_breed_entity.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({required this.catBreed, super.key});

  final CatBreedEntity catBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: '${catBreed.id}name',
          child: Material(
            color: Colors.transparent,
            child: Text(
              catBreed.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: catBreed.id,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: catBreed.image,
              placeholder: (context, url) => Center(
                child: LoadingAnimationWidget.hexagonDots(
                  color: const Color(0xFFEA3799),
                  size: 200,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(catBreed.description),
                    const SizedBox(height: 16),
                    Text('Origin: ${catBreed.origin}'),
                    const SizedBox(height: 16),
                    Text('Temperament: ${catBreed.temperament}'),
                    const SizedBox(height: 16),
                    Text('Life Span: ${catBreed.lifeSpan} years'),
                    const SizedBox(height: 16),
                    Text('Adaptability: ${catBreed.adaptability}'),
                    const SizedBox(height: 16),
                    Text('Grooming: ${catBreed.grooming}'),
                    const SizedBox(height: 16),
                    Text('Intelligence: ${catBreed.intelligence}'),
                    const SizedBox(height: 16),
                    Text('Experimental: ${catBreed.experimental}'),
                    const SizedBox(height: 16),
                    Text('Hairless: ${catBreed.hairless == 0 ? 'No' : 'Yes'}'),
                    const SizedBox(height: 16),
                    Text('Natural: ${catBreed.natural == 0 ? 'No' : 'Yes'}'),
                    const SizedBox(height: 16),
                    Text('Rare: ${catBreed.rare}'),
                    const SizedBox(height: 16),
                    Text('Hypoallergenic: ${catBreed.hypoallergenic}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
