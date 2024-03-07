
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 235,
      child: Image.asset(Assets.imagesForgetPassword),
    );
  }
}