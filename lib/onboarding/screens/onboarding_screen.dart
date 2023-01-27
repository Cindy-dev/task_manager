import 'package:flutter/material.dart';
import 'package:task_manager/onboarding/utilities/onboarding_strings.dart';
import 'package:task_manager/task/view/home_screen.dart';
import 'package:task_manager/utilities/app_constants/app_colors.dart';
import 'package:task_manager/utilities/app_constants/app_strings.dart';
import 'package:task_manager/utilities/device_navigation.dart';
import 'package:task_manager/utilities/device_size.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = context.screenHeight();
    final deviceWidth = context.screenWidth();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: deviceHeight / 15, bottom: deviceHeight / 30),
            alignment: Alignment.center,
            child: Image.asset(
              OnboardingStrings.onboardingAsset,
              alignment: Alignment.center,
            ),
          ),
          const Text(
            OnboardingStrings.appName,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                fontFamily: AppStrings.fontName),
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              OnboardingStrings.appHeader,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppStrings.fontName,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => navigatePush(context, const HomeScreen()),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: context.screenHeight() / 14,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                OnboardingStrings.continueW,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontName,
                    color: AppColors.white),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
