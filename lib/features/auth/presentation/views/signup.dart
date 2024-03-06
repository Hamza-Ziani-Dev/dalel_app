// ignore_for_file: non_constant_identifier_names
import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_signup.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_have_account.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text.dart';
import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
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
              child: CustomFormSignup(),
            ),
            SliverToBoxAdapter(
              child: CustomHaveAccount(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn,
                onTap: () {
                  customReplacementNavigate(context, '/signin');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
