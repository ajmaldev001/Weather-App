import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_assignment/configs/utils/get_weather_icons.dart';
import 'package:weather_app_assignment/view/widgets/weekly_forecaste_tile.dart';
import 'package:weather_app_assignment/view_model/weather.dart';

class WeeklyForecastView extends StatefulWidget {
  const WeeklyForecastView({super.key});

  @override
  State<WeeklyForecastView> createState() => _WeeklyForecastViewState();
}

class _WeeklyForecastViewState extends State<WeeklyForecastView> {
 WeatherProvider? weatherProvider;

  @override
  void initState() {
    weatherProvider = Provider.of<WeatherProvider>(context,listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: weatherProvider?.fetchWeeklyForecast(), 
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Expanded(
                child: Center(
                  child: Text('Something error occurred'),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final mockDates = [
                    '2024-09-01', '2024-09-02', '2024-09-03', '2024-09-04', 
                    '2024-09-05', '2024-09-06', '2024-09-07', '2024-09-08',
                    '2024-09-09', '2024-09-10'
                  ];
                  final mockTemps = [22, 24, 21, 25, 26, 20, 27, 23, 19, 28];
                  final mockIcons = [800, 801, 802, 803, 804, 805, 806, 807, 808, 809];

                  final dayOfWeek = DateTime.parse(mockDates[index]);
                  final date = mockDates[index];
                  final temp = mockTemps[index];
                  final icon = mockIcons[index];

                  return WeeklyForecastTile(
                    date: date,
                    day: dayOfWeek.day.toString(),
                    icon: getWeatherIcon2(icon),
                    temp: temp.round(),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }
        )
      ],
    );
  }
}