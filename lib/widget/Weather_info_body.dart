import 'package:flutter/material.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              getThemeColor(weatherModel.weathercondition)[300]!,
              getThemeColor(weatherModel.weathercondition)[50]!
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityname,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Update at ${weatherModel.date.hour} : ${weatherModel.date.minute}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Image(
                    image: NetworkImage("http:${weatherModel.image}"),
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 60,
                ),
                Column(
                  children: [
                    Text("maxtemp:${weatherModel.maxtemp.round()}"),
                    Text("mintemp:${weatherModel.mintemp.round()}")
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              weatherModel.weathercondition,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
