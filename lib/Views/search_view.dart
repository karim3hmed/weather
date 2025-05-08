import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              Navigator.of(context).pop();
              var get_weather_cubit = BlocProvider.of<GetWeatherCubit>(context);
              get_weather_cubit.getweather(cityname: value);
            },
            decoration: InputDecoration(
              label: Text("search"),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              suffixIcon: Icon(Icons.search),
              hintText: "Enter city Name",
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.lightBlue,
              )),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
