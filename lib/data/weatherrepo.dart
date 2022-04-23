import 'package:bweather/data/weatherapiclient.dart';
import 'package:bweather/main.dart';
import 'package:bweather/models/WeatherModal.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<Weather> GetWeather(String City) async {
    int ID = await weatherApiClient.GetLocationId(City);
    return await weatherApiClient.GetWeather(ID);
    
  }
}
