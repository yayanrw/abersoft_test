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
        Lottie.asset('assets/lottie/no_data.json'),
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
