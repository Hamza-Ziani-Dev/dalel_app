import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomHaveAccount extends StatelessWidget {
  const CustomHaveAccount({super.key, this.text1, this.text2, this.onTap});
  final String? text1, text2;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: text1, style: CustomTextStyles.poppins400style12),
              TextSpan(
                text: text2,
                style: CustomTextStyles.poppins400style12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
