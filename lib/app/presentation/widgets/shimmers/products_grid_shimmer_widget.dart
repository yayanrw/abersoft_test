import 'package:abersoft_test/app/presentation/widgets/shimmers/product_shimmer_widget.dart';
import 'package:flutter/material.dart';

class ProductsGridShimmerWidget extends StatelessWidget {
  const ProductsGridShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const totalItem = 10;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 96,
          mainAxisSpacing: 27,
          crossAxisSpacing: (MediaQuery.of(context).size.width / 5) + 4,
          childAspectRatio: 1,
        ),
        itemCount: totalItem,
        itemBuilder: (context, index) {
          final isLastItem = index == totalItem - 1;
          return ProductShimmerWidget(isLastItem: isLastItem);
        },
      ),
    );
  }
}
