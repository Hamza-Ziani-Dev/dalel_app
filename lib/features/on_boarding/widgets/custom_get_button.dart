// Get Buttons
import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/on_boarding/data/models/on_boarding_data.dart';
import 'package:dalel_app/features/on_boarding/views/functions/on_boarding_visited.dart';
import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
import 'package:flutter/material.dart';

class GetButton extends StatelessWidget {
  const GetButton(
      {super.key, required this.currentIndex, required this.controller});
  final PageController controller;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomButton(
            text: AppStrings.createAccount,
            onPressed: () {
              onBoardingVisited();
              customNavigate(context, "/signup");
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {
              onBoardingVisited();
              customNavigate(context, '/signin');
            },
            child: Text(
              AppStrings.loginNow,
              style: CustomTextStyles.poppins300style16
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          )
        ],
      );
    } else {
      return CustomButton(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(
              duration: const Duration(microseconds: 200),
              curve: Curves.bounceIn);
        },
      );
    }
  }
}
