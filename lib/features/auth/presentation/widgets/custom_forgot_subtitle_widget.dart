import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordSubTitle extends StatelessWidget {
  const ForgotPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Text(
        AppStrings.forgotPasswordsubTitle,
        style: CustomTextStyles.poppins400style12.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}