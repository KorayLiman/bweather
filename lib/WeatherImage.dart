import 'package:bweather/blocs/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Image.network(
            "https://www.metaweather.com/static/img/weather/png/" +
                (state as WeatherLoaded)
                    .weather
                    .consolidatedWeather![0]
                    .weatherStateAbbr
                    .toString() +
                ".png");
      },
    );
  }
}
