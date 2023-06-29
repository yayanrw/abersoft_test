import 'package:abersoft_test/app/presentation/widgets/buttons/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataLottieWidget extends StatelessWidget {
  const NoDataLottieWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/lottie/no-data.json'),
        const SizedBox(height: 16),
        const Text("No Data"),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: ButtonWidget(
            text: "Refresh",
            isLoading: false,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
