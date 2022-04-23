import 'package:bweather/HomePage.dart';
import 'package:bweather/blocs/bloc/theme/bloc/theme_bloc.dart';
import 'package:bweather/blocs/bloc/weather_bloc.dart';
import 'package:bweather/data/weatherapiclient.dart';
import 'package:bweather/data/weatherrepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  SetupLocator();
  runApp(BlocProvider<ThemeBloc>(
    create: (context) => ThemeBloc(),
    child: MyApp(),
  ));
}

GetIt locator = GetIt.instance;
void SetupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, state) {
        return MaterialApp(
          theme: (state as AppTheme).themeData,
          
            title: 'Weather App',
            debugShowCheckedModeBanner: false,
            home: BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc(),
              child: HomePage(),
            ));
      },
    );
  }
}
