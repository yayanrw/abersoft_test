import 'package:abersoft_test/app/presentation/widgets/images/product_image_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/texts/SubTitleWidget.dart';
import 'package:abersoft_test/app/presentation/widgets/texts/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 19),
                  const TitleWidget(text: "Our Portfolio"),
                  const SizedBox(height: 21),
                  const SubTitleWidget(text: "Best Product"),
                  const SizedBox(height: 35),
                  controller.bestProducts.isEmpty
                      ? const Center(
                    child: Text("No Data"),
                  )
                      : SizedBox(
                    height: 96,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      itemCount: controller.bestProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = controller.bestProducts[index];
                        final isLastItem =
                            index == controller.bestProducts.length - 1;

                        return ProductImageWidget(
                          imgUrl: product.imageUrl,
                          isLastItem: isLastItem,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          )
        ),
      ),
    );
  }
}
