import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Views/Home_view.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(Weatherapp());
}

class Weatherapp extends StatelessWidget {
  const Weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, Weatherstate>(
        builder: (context, state) {
          return Builder(builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weathercondition,
                ),
              ),
              home: HomeView(),
            );
          });
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.lightBlue;
    case "cloudy":
      return Colors.grey;
    case "overcast":
    case "mist":
      return Colors.blueGrey;
    case "patchy rain possible":
    case "light rain":
    case "moderate rain":
    case "heavy rain":
      return Colors.blue;
    case "patchy snow possible":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
    case "fog":
    case "freezing fog":
      return Colors.lightBlue;
    case "blizzard":
      return Colors.blueGrey;
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.deepOrange;
    case "ice pellets":
      return Colors.teal;
    case "patchy light drizzle":
    case "light drizzle":
      return Colors.cyan;
    default:
      return Colors.blue;
  }
}
