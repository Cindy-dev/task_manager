import 'package:flutter/material.dart';
import 'package:task_manager/utilities/device_size.dart';
import '../../utilities/app_constants/app_colors.dart';
import '../../utilities/app_constants/app_strings.dart';

class TileContainer extends StatelessWidget {
  final IconData iconHeader;
  final String text;
  final Widget action;
  final IconData arrowFwd;
  const TileContainer(
      {Key? key,
      required this.iconHeader,
      required this.text,
      required this.action,
      required this.arrowFwd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight() / 9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.gray.withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(
                  iconHeader,
                  color: AppColors.black,
                ),
                const SizedBox(width: 10,),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontName,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               action,
                const SizedBox(width: 10,),
                Icon(
                  arrowFwd,
                  color: AppColors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
