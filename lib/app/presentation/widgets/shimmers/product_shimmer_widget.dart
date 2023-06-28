import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({super.key, required this.isLastItem});
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Base color of the box
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 145,
        height: 96,
        margin: EdgeInsets.only(right: isLastItem ? 0 : 10),
        decoration: BoxDecoration(
          color: Colors.grey[300]!, //
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
