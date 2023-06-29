import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:abersoft_test/app/presentation/widgets/images/product_image_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/texts/no_data_text_widget.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const NoDataTextWidget()
        : SizedBox(
            height: 96,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final Product product = products[index];
                final isLastItem = index == products.length - 1;

                return ProductImageWidget(
                  key: Key("product_horizontal_${product.id.toString()}"),
                  imgUrl: product.imageUrl,
                  isLastItem: isLastItem,
                );
              },
            ),
          );
  }
}
