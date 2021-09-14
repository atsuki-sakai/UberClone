import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarStyle extends StatelessWidget {
  const StatusBarStyle({Key? key, required this.child, required this.brightness}) : super(key: key);

  final Widget child;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
      ),
      child: child,
    );
  }
}
