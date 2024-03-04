// ignore_for_file: non_constant_identifier_names
import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/widgets/custom_have_account.dart';
import 'package:dalel_app/features/auth/widgets/custom_term_condition.dart';
import 'package:dalel_app/features/auth/widgets/custom_text_field_widget.dart';
import 'package:dalel_app/features/auth/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            ),
            const SliverToBoxAdapter(
              child: WelcomeTextWidget(
                text: AppStrings.welcome,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFieldWidget(
                labelText: AppStrings.fristName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFieldWidget(
                labelText: AppStrings.lastName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFieldWidget(
                labelText: AppStrings.emailAddress,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFieldWidget(
                labelText: AppStrings.password,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTermCondition(),
            ),
            SliverToBoxAdapter(
              child: CustomButton(
                onPressed: () {},
                text: AppStrings.signUp,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomHaveAccount(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signUp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

