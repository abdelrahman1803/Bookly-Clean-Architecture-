import 'package:bookly/core/shimmer/core/shimmer_container.dart';
import 'package:bookly/core/utilities/widgets/custom_error_image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 0.7,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            placeholder: (context, url) => const ShimmerContainer(
              width: double.infinity,
              height: double.infinity,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            errorWidget: (context, url, error) => const ErrorImageWidget(),
          ),
        ),
      ),
    );
  }
}
