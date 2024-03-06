import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                customReplacementNavigate(context, '/signup');
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: const Center(child: Text("Home")));
  }
}
