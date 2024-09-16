import 'package:cached_network_image/cached_network_image.dart';
import 'package:catopia/domain/entities/cat_breed_entity.dart';
import 'package:catopia/ui/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BreedCard extends StatelessWidget {
  const BreedCard({required this.catBreed, super.key});

  final CatBreedEntity catBreed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
            builder: (context) => DetailPage(catBreed: catBreed),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Hero(
                  tag: '${catBreed.id}name',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(catBreed.name),
                  ),
                ),
                const Spacer(),
                Text(catBreed.origin),
              ],
            ),
            const SizedBox(height: 16),
            Hero(
              tag: catBreed.id,
              child: CachedNetworkImage(
                height: 250,
                fit: BoxFit.cover,
                imageUrl: catBreed.image,
                placeholder: (context, url) => Center(
                  child: LoadingAnimationWidget.hexagonDots(
                    color: const Color(0xFFEA3799),
                    size: 50,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(catBreed.origin),
                const Spacer(),
                Text('Intelligence: ${catBreed.intelligence}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
