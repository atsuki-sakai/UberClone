import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, required this.onPressed, required this.icon}) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 55.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(55.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black54, offset: Offset(1, 1), blurRadius: 1),
          ]),
      child: CircleAvatar(
        child: IconButton(
          icon: Icon(
            icon,
            size: 30,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
