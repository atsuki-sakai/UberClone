import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.color,
      this.textStyle,
      this.height})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final TextStyle? textStyle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    const _defaultStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0);
    return SizedBox(
      width: double.infinity,
      height: height ?? 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle ?? _defaultStyle,
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
      ),
    );
  }
}
