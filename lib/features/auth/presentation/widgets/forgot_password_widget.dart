import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
import 'package:flutter/widgets.dart';

class ForgetPasswordTestWidget extends StatelessWidget {
  const ForgetPasswordTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customReplacementNavigate(context, "/forgotPassword");
      },
      child: const Align(
        alignment: Alignment.bottomRight,
        child: Text(
          AppStrings.forgotPassword,
          style: CustomTextStyles.poppins300style16,
        ),
      ),
    );
  }
}
