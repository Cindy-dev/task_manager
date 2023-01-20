import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/utilities/app_constants/app_colors.dart';
import 'app_constants/app_strings.dart';
import 'device_navigation.dart';

void dialog(BuildContext context, String error, String title) {
  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: AppStrings.fontName,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor)),
            content: Text(error,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: AppStrings.fontName,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black)),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: AppStrings.fontName,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor)),
                onPressed: () => navigatePop(context),
              )
            ],
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: AppStrings.fontName,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor)),
            content: Text(error,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: AppStrings.fontName,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black)),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: AppStrings.fontName,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor)),
                onPressed: () => navigatePop(context),
              )
            ],
          );
        });
  }
}