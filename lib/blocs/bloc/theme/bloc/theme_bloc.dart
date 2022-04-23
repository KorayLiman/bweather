import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(AppTheme(
            themeData: ThemeData.light(), materialColor: Colors.blue)) {
    on<ThemeEvent>((event, emit) {
      if (event is SwitchTheme1) {
        AppTheme appTheme;
        switch (event.wheatherstateshortcut) {
          case "sn":
          
          case "sl":
          case "h":
          case "t":
          case "hc":
            appTheme = AppTheme(
                themeData: ThemeData(primaryColor: Colors.blueGrey),
                materialColor: Colors.grey);
            break;
          case "hr":
          case "lr":
          case "s":
            appTheme = AppTheme(
                themeData: ThemeData(primaryColor: Colors.indigoAccent),
                materialColor: Colors.indigo);
            break;
          default:
            appTheme = AppTheme(
                themeData: ThemeData(primaryColor: Colors.green),
                materialColor: Colors.green);
            break;
        }
        emit(appTheme);
      }
    });
  }
}
