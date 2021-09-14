import 'package:flutter/material.dart';

class RoundTextField extends StatefulWidget {
  const RoundTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.obscureText,
    this.height,
    this.bgColor,
    this.textStyle,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final bool? obscureText;
  final double? height;
  final Color? bgColor;
  final TextStyle? textStyle;

  @override
  _RoundTextFieldState createState() => _RoundTextFieldState();
}

class _RoundTextFieldState extends State<RoundTextField> {
  @override
  Widget build(BuildContext context) {
    const _defaultHeight = 60.0;
    const _defaultTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
    );
    return Container(
      alignment: Alignment.center,
      height: widget.height ?? _defaultHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.bgColor ?? Colors.grey.shade200,
        borderRadius: BorderRadius.all(
          Radius.circular(_defaultHeight / 2),
        ),
      ),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 20.0,
          ),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: widget.textStyle ?? _defaultTextStyle,
          labelText: widget.labelText,
          labelStyle: widget.textStyle ?? _defaultTextStyle,
        ),
      ),
    );
  }
}
