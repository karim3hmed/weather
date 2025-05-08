import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String ApiKey = "1a0e75d577704114ab8113144252802";

  WeatherService(this.dio);

  Future<WeatherModel> getcurrentweather({required String cityname}) async {
    try {
      Response response = await dio
          .get("$baseUrl/v1/forecast.json?key=$ApiKey&q=$cityname&days=14");
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage =
          e.response?.data["error"]["message"] ?? "oops there was an error";
      throw Exception(errormessage);
    } catch (e) {
      throw Exception("oops there was an eror , try later ");
    }
  }
}
