import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/on_boarding/widgets/custom_smoot_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatefulWidget {
  const OnBoardingWidgetBody({super.key});

  @override
  State<OnBoardingWidgetBody> createState() => _OnBoardingWidgetBodyState();
}

class _OnBoardingWidgetBodyState extends State<OnBoardingWidgetBody> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(Assets.imagesOnBoarding1),
              const SizedBox(
                height: 24,
              ),
              CutsomSmootIndicator(
                controller: _controller,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Explore The history with Dalel in a smart way',
                style: CustomTextStyles.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Using our app’s history libraries you can find many historical periods ',
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
              )
            ],
          );
        },
      ),
    );
  }
}
