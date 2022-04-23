import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key,required this.SelectedCity}) : super(key: key);

  final String SelectedCity;

  @override
  Widget build(BuildContext context) {
    return Text(SelectedCity);
  }
}
