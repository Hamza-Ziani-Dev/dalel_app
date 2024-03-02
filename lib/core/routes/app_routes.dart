import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splach/presentation/views/splach_view.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplachView();
      },
    ),
  ],
);
