import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CutsomSmootIndicator extends StatelessWidget {
  const CutsomSmootIndicator({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller, // PageController
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.deepBrown,
        dotWidth: 10,
        dotHeight: 7,
      ),
      // your preferred effect
      onDotClicked: (index) {},
    );
  }
}