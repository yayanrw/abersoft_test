import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:abersoft_test/app/presentation/widgets/images/product_image_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/texts/no_data_text_widget.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const NoDataTextWidget()
        : Padding(
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
              itemCount: products.length,
              itemBuilder: (context, index) {
                final Product product = products[index];

                return ProductImageWidget(
                  key: Key("product_grid_${product.id.toString()}"),
                  imgUrl: product.imageUrl,
                  isLastItem: true,
                );
              },
            ),
          );
  }
}
