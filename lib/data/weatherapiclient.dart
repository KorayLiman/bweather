import 'dart:convert';
import 'dart:io';

import 'package:bweather/models/WeatherModal.dart';
import 'package:http/http.dart';

class WeatherApiClient {
  static const baseurl = "https://www.metaweather.com/";
  final HttpClient httpClient = HttpClient();
  Future<int> GetLocationId(String CityName) async {
    final CityURL = baseurl + "api/location/search/?query=" + CityName;
    final Response = await get(Uri.parse(CityURL));

    if (Response.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }
    final responsejson = (jsonDecode(Response.body)) as List;
    return responsejson[0]["woeid"];
  }

  Future<Weather> GetWeather(int CityID) async {
    final WeatherUrl = baseurl + "api/location/$CityID";
    final WeatherResponse = await get(Uri.parse(WeatherUrl));
    if (WeatherResponse.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }
    final WeatherResponseJson = jsonDecode(WeatherResponse.body);
    return Weather.fromJson(WeatherResponseJson);
  }
}
