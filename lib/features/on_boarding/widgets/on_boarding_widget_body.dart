import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/on_boarding/data/models/on_boarding_data.dart';
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
    return SizedBox(
      height: 500,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 343,
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        onBoardingData[index].imagePath,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
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
                onBoardingData[index].title,
                style: CustomTextStyles.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                onBoardingData[index].subTitle,
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          );
        },
      ),
    );
  }
}
