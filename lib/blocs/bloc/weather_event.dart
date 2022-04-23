part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable{}
class FetchWeatherEvent extends WeatherEvent{
 final String CityName;

  FetchWeatherEvent({required this.CityName});
 
  @override
  // TODO: implement props
  List<Object?> get props => [CityName];

}

class RefreshWeatherEvent extends WeatherEvent{
 final String CityName;

  RefreshWeatherEvent({required this.CityName});
 
  @override
  // TODO: implement props
  List<Object?> get props => [CityName];

}


