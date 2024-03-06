import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/views/signin.dart';
import 'package:dalel_app/features/auth/presentation/views/signup.dart';
import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingView();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthCubit(), // Create an instance of AuthCubit
          child: const SignupView(),
        );
      },
    ),
    GoRoute(
      path: '/signin',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthCubit(), // Create an instance of AuthCubit
          child: const SigninView(),
        );
      },
    ),
  ],
);
