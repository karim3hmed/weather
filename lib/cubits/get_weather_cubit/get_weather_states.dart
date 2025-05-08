import 'package:weather/models/weather_model.dart';

class Weatherstate {}

class Weatherinitialstate extends Weatherstate {}

class Weatherloadedstate extends Weatherstate {
  final WeatherModel weatherModel;
  Weatherloadedstate(this.weatherModel);
}

class Weatherfailerstate extends Weatherstate {}
