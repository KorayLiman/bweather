import 'package:bweather/blocs/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Text(
          "Last Update" +
              (state as WeatherLoaded).weather.time!.hour.toString(),
        );
      },
    );
  }
}
