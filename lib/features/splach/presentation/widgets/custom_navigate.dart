 import 'package:go_router/go_router.dart';

Future<Null> customNavigate(context, String path) {
    return Future.delayed(const Duration(seconds: 2), () {
    GoRouter.of(context).push(path);
  });
  }