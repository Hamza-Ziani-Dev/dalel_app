import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/auth/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class CustomTermCondition extends StatelessWidget {
  const CustomTermCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomChekBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: AppStrings.iHaveAgreeToOur,
                  style: CustomTextStyles.poppins400style12
                      .copyWith(fontWeight: FontWeight.w700)),
              TextSpan(
                  text: AppStrings.termsAndCondition,
                  style: CustomTextStyles.poppins400style12
                      .copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ],
    );
  }
}
