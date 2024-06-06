import 'package:flutter/cupertino.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [Text("Splash Screen Page"),],
    ));
  }
}
