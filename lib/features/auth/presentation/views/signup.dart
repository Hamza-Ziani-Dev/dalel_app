// ignore_for_file: non_constant_identifier_names
import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_have_account.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            ),
            SliverToBoxAdapter(
              child: WelcomeTextWidget(
                text: AppStrings.welcome,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomForm(),
            ),
            SliverToBoxAdapter(
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
