import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Views/services/weather_service.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';

class GetWeatherCubit extends Cubit<Weatherstate> {
  GetWeatherCubit() : super(Weatherinitialstate());

  WeatherModel? weatherModel;
  getweather({required String cityname}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService(Dio()).getcurrentweather(cityname: cityname);
      emit(Weatherloadedstate(weatherModel));
    } catch (e) {
      emit(Weatherfailerstate());
    }
  }
}
