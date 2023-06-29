import 'package:abersoft_test/app/presentation/widgets/shimmers/product_shimmer_widget.dart';
import 'package:flutter/material.dart';

class ProductsGridShimmerWidget extends StatelessWidget {
  const ProductsGridShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const totalItem = 10;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = MediaQuery.of(context).size.width;
          int crossAxisCount = 2;

          if (screenWidth >= 600) {
            crossAxisCount = 3;
          }

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisExtent: 96,
              mainAxisSpacing: 27,
              crossAxisSpacing: (MediaQuery.of(context).size.width / 5) + 4,
              childAspectRatio: 1,
            ),
            itemCount: totalItem,
            itemBuilder: (context, index) {
              return ProductShimmerWidget(
                key: Key("product_grid_${index.toString()}"),
                isLastItem: true,
              );
            },
          );
        },
      ),
    );
  }
}
