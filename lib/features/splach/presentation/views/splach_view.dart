import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  @override
  void initState() {
    bool onBoardingVisited =
        getIt<CacheHelper>().getData(key: 'OnBoardingVisited') ?? false;
    if (onBoardingVisited == true) {
      Future.delayed(const Duration(seconds: 2), () {
        FirebaseAuth.instance.currentUser == null
            ? customReplacementNavigate(context, '/signin')
            : FirebaseAuth.instance.currentUser!.emailVerified == true
                ? customReplacementNavigate(context, '/home')
                : customReplacementNavigate(context, '/home');
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        customReplacementNavigate(context, '/onBoarding');
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}
