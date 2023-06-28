import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget(
      {super.key, required this.imgUrl, required this.isLastItem});

  final String imgUrl;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 96,
      margin: EdgeInsets.only(right: isLastItem ? 0 : 10),
      decoration: const BoxDecoration(
        // color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: CachedNetworkImage(
          fit: BoxFit.fitWidth,
          imageUrl: imgUrl,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
