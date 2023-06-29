import 'package:abersoft_test/app/presentation/widgets/grid_views/products_grid_view.dart';
import 'package:abersoft_test/app/presentation/widgets/list_views/products_list_view.dart';
import 'package:abersoft_test/app/presentation/widgets/lotties/no_data_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/shimmers/products_grid_shimmer_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/shimmers/products_horizontal_shimmer_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/texts/SubTitleWidget.dart';
import 'package:abersoft_test/app/presentation/widgets/texts/TitleWidget.dart';
import 'package:abersoft_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Abersoft Flutter Test"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                controller.logOut();
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.getProducts();
          },
          child: controller.allProducts.isEmpty &&
                  controller.bestProducts.isEmpty &&
                  !controller.isLoading
              ? const NoDataWidget()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 19),
                      const TitleWidget(text: "Our Portfolio"),
                      const SizedBox(height: 21),
                      const SubTitleWidget(text: "Best Product"),
                      const SizedBox(height: 35),
                      controller.isLoading
                          ? const ProductHorizontalShimmerWidget()
                          : ProductsListView(products: controller.bestProducts),
                      const SizedBox(height: 28),
                      const SubTitleWidget(text: "All Product"),
                      const SizedBox(height: 21),
                      controller.isLoading
                          ? const ProductsGridShimmerWidget()
                          : ProductsGridView(products: controller.allProducts),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.CREATE_PRODUCT);
            },
            child: const Icon(Icons.add),
          ),
        ),
      );
    });
  }
}
