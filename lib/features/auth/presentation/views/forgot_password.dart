import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_forgot_subtitle_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_forgot_password.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forgot_password_image.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              child: Text(
                AppStrings.forgotPassword,
                style: CustomTextStyles.poppins300style16,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: ForgotPasswordImage(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(
            child: ForgotPasswordSubTitle(),
          ),
          SliverToBoxAdapter(
            child: CustomFormForgotPassword(),
          )
        ],
      ),
    );
  }
}
