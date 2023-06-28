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
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: CachedNetworkImage(
          fit: BoxFit.fitWidth,
          imageUrl: imgUrl,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Builder(
            builder: (BuildContext context) {
              return Container(
                width: 145,
                height: 96,
                margin: EdgeInsets.only(right: isLastItem ? 0 : 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
