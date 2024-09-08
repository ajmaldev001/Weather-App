import 'package:flutter/material.dart';
import 'package:weather_app_assignment/configs/color/app_colors.dart';
import 'package:weather_app_assignment/configs/themes/text_styles.dart';
import 'package:weather_app_assignment/view/widgets/weekly_forecast_view.dart';
import 'package:weather_app_assignment/view/widgets/gradient_container.dart';


class ForecastReportScreen extends StatelessWidget {
  const ForecastReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        // Page Title
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Forecast Report',
            style: TextStyles.h1,
          ),
        ),

        const SizedBox(height: 40),

        // Today's date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Today',
              style: TextStyles.h2,
            ),
            Text(
              DateTime.now().day.toString(),
              style: TextStyles.subtitleText,
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Next Forecast
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Next Forecast',
              style: TextStyles.h2,
            ),
            Icon(
              Icons.calendar_month_rounded,
              color: AppColors.white,
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Weekly forecast
         const WeeklyForecastView(),
      ],
    );
  }
}

