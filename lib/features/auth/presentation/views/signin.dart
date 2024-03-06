import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_from_signin.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_have_account.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_welcome_banner.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text.dart';
import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: WelcomeBanner(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: WelcomeTextWidget(
              text: AppStrings.welcomeBack,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomFormSignin(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomHaveAccount(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () {
                customReplacementNavigate(context, '/signup');
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
