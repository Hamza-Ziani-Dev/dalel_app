import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/on_boarding/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 40,
            ),
            customNavbarApp(),
            const OnBoardingWidgetBody(),
            const SizedBox(
              height: 40,
            ),
            const CustomButton(
              text: AppStrings.next,
            ),
            const SizedBox(
              height: 17,
            ),
          ],
        ),
      )),
    );
  }

  Align customNavbarApp() {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        AppStrings.skip,
        style: CustomTextStyles.poppins300style16
            .copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
