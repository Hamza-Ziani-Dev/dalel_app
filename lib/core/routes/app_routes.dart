import 'package:dalel_app/features/on_boarding/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splach/presentation/views/splach_view.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplachView();
      },
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingView();
      },
    ),
  ],
);
