import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.child, required this.color})
      : super(key: key);

  final Widget child;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [color[700]!, color[500]!, color[200]!])),
    );
  }
}
