import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Views/search_view.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/widget/No%20_weather_body.dart';
import 'package:weather/widget/Weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: Text(
          "Weather App",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SearchView();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, Weatherstate>(
        builder: (context, state) {
          if (state is Weatherinitialstate) {
            return NoWeatherBody();
          } else if (state is Weatherloadedstate) {
            return WeatherInfoBody(weatherModel: state.weatherModel);
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "there was An error , try again",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
