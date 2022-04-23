import 'package:bloc/bloc.dart';
import 'package:bweather/data/weatherrepo.dart';
import 'package:bweather/main.dart';
import 'package:bweather/models/WeatherModal.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async{
      if (event is FetchWeatherEvent) {
        emit(WeatherLoading());
        try {
          
          final Weather weather =  await weatherRepository.GetWeather(event.CityName);
          emit(WeatherLoaded(weather: weather));
        } catch (error) {
          emit(WeatherError());
        }
      }
      else if (event is RefreshWeatherEvent) {
       
        try {
          
          final Weather weather =  await weatherRepository.GetWeather(event.CityName);
          emit(WeatherLoaded(weather: weather));
        } catch (error) {
          emit(state);
        }
      }
      
    });
  }
}
