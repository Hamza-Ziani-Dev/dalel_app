import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/on_boarding/widgets/custom_get_button.dart';
import 'package:dalel_app/features/on_boarding/widgets/on_boarding_widget_body.dart';
import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
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
            OnBoardingWidgetBody(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: _controller,
            ),
            const SizedBox(
              height: 10,
            ),
            GetButton(currentIndex: currentIndex, controller: _controller),
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
      child: GestureDetector(
        onTap: () {
          customReplacementNavigate(context, '/signin');
        },
        child: Text(
          AppStrings.skip,
          style: CustomTextStyles.poppins300style16
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
