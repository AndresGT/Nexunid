import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: Image.asset(
          'assets/logos/logo.png',
          width: size.width * 0.8,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
