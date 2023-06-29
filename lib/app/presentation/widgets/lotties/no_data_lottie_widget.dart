import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataLottieWidget extends StatelessWidget {
  const NoDataLottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/no_data.json'),
    );
  }
}
