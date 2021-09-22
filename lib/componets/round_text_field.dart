import 'package:flutter/material.dart';

// FIXME - onChageとcontrollerの併用は入力時にバグが発生

class RoundTextField extends StatefulWidget {
  const RoundTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.obscureText,
    this.height,
    this.bgColor,
    this.keyBoardType,
    this.textStyle,
    this.autoFocus,
    this.focusNode,
    this.nextFocus,
    this.onEditingComplete,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final bool? obscureText;
  final double? height;
  final Color? bgColor;
  final TextInputType? keyBoardType;
  final TextStyle? textStyle;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Function? onEditingComplete;
  final Function? onChanged;
  final TextEditingController? controller;
  @override
  _RoundTextFieldState createState() => _RoundTextFieldState();
}

class _RoundTextFieldState extends State<RoundTextField> {

  @override
  void dispose() {
    if(widget.controller != null){
      widget.controller!.dispose();
    }
    super.dispose();
  }

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
        controller: widget.controller,
        textInputAction: widget.nextFocus != null ? TextInputAction.next : TextInputAction.done,
        autofocus: widget.autoFocus ?? false,
        focusNode: widget.focusNode,
        onChanged: (value) {
          if(widget.onChanged != null){
            widget.onChanged!(value);
          }
        },
        onEditingComplete: (){
          if(widget.nextFocus != null){
            FocusScope.of(context).requestFocus(widget.nextFocus);
          }else{
            FocusScope.of(context).unfocus();
          }
          // REVIEW - 呼び出し位置は最後で良いか？
          if(widget.onEditingComplete != null) {
            widget.onEditingComplete!();
          }
        },
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyBoardType ?? TextInputType.emailAddress,
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
