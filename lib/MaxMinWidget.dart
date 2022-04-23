import 'package:bweather/blocs/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaxMinWidget extends StatelessWidget {
  const MaxMinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Max: " +
                (state as WeatherLoaded)
                    .weather
                    .consolidatedWeather![0]
                    .maxTemp
                    .toString()),
            Text("Min: " +
                (state as WeatherLoaded)
                    .weather
                    .consolidatedWeather![0]
                    .minTemp
                    .toString())
          ],
        );
      },
    );
  }
}
