import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_manager/task/utilities/task_strings/home_strings.dart';
import 'package:task_manager/utilities/app_constants/app_colors.dart';

import '../../utilities/app_constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SfCalendar(
            todayHighlightColor: AppColors.primaryColor,
            view: CalendarView.month,
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.appointment),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: const Text(
              HomeStrings.priority,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppStrings.fontName,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
