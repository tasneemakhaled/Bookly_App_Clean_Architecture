import 'package:bookly_app_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          placeholder: (context, url) => Image.asset(
            AssetsData.testImage,
            fit: BoxFit.fill,
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade200,
            child: const Icon(
              Icons.broken_image,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
