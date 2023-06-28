import 'package:abersoft_test/app/presentation/widgets/texts/SubTitleWidget.dart';
import 'package:abersoft_test/app/presentation/widgets/texts/TitleWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 19),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(text: "Our Portofolio"),
              const SizedBox(height: 21),
              const SubTitleWidget(text: "Best Product"),
              const SizedBox(height: 35),
              Container(
                width: 145,
                height: 96,
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: CachedNetworkImage(
                  imageUrl: "http://via.placeholder.com/350x150",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
