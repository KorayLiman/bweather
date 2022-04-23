import 'dart:async';

import 'package:bweather/ChooseCity.dart';
import 'package:bweather/LastUpdateWidget.dart';
import 'package:bweather/LocationWidget.dart';
import 'package:bweather/MaxMinWidget.dart';
import 'package:bweather/WeatherImage.dart';
import 'package:bweather/background.dart';
import 'package:bweather/blocs/bloc/theme/bloc/theme_bloc.dart';
import 'package:bweather/blocs/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late String SelectedCity;
  Completer<void> _completer = Completer();
  @override
  Widget build(BuildContext context) {
    final weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("WeatherApp"),
        actions: [
          IconButton(
              onPressed: () async {
                SelectedCity = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ChooseCity();
                  },
                ));
                if (SelectedCity != null) {
                  weatherbloc.add(FetchWeatherEvent(CityName: SelectedCity));
                }
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherbloc,
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: const Text("Sehir seciniz"),
              );
            } else if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              final weather = state.weather;
              SelectedCity = weather.title.toString();
              BlocProvider.of<ThemeBloc>(context).add(SwitchTheme1(
                  wheatherstateshortcut: weather
                      .consolidatedWeather![0].weatherStateAbbr
                      .toString()));

              _completer.complete();
              _completer = Completer();

              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Background(
                              color: (state as AppTheme).materialColor,
                              child: RefreshIndicator(
                                onRefresh: () {
                                  weatherbloc.add(RefreshWeatherEvent(CityName: SelectedCity));
                                  return _completer.future;
                                },
                                child: ListView(
                                  children: [
                                    Center(
                                        child: LocationWidget(
                                      SelectedCity: weather.title!,
                                    )),
                                    Center(child: LastUpdateWidget()),
                                    Center(child: WeatherImage()),
                                    Center(child: MaxMinWidget())
                                  ],
                                ),
                              ),
                            );
                },
              );
            } else {
              return Center(
                child: const Text("Hata"),
              );
            }
          },
        ),
      ),
    );
  }
}
