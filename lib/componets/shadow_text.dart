import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  const ShadowText({Key? key, required this.title, this.shadow}) : super(key: key);

  final String title;
  final List<Shadow>? shadow;

  @override
  Widget build(BuildContext context) {
    final  _defaultShadow =  Shadow(
      color: Colors.grey.shade300,
      offset: Offset(3, 3),
      blurRadius: 10,
    );
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.grey.shade800,
          shadows: shadow ?? [_defaultShadow]),
    );
  }
}
