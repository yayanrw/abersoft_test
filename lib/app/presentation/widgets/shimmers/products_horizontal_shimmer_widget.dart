import 'package:abersoft_test/app/presentation/widgets/shimmers/product_shimmer_widget.dart';
import 'package:flutter/material.dart';

class ProductHorizontalShimmerWidget extends StatelessWidget {
  const ProductHorizontalShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const totalItem = 5;

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      itemCount: totalItem,
      // Total number of items
      itemBuilder: (BuildContext context, int index) {
        final isLastItem = index == totalItem - 1;
        return ProductShimmerWidget(isLastItem: isLastItem);
      },
    );
  }
}
