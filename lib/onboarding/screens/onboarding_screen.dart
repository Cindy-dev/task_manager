import 'package:flutter/material.dart';
import 'package:task_manager/utilities/device_size.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = context.screenHeight();
    final deviceWidth = context.screenWidth();
    return Scaffold(
      body: Column(
        children: [Image.asset("asset/images/onboarding.png")],
      ),
    );
  }
}
