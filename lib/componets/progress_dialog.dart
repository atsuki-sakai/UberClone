import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProgressDialog{
  const ProgressDialog({required this.context, this.message});
  final BuildContext context;
  final String? message;

  void start() {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(20.0),
        elevation: 0.0,
        children: [
          Center(
            child: SizedBox(
              width: 120.0,
              height: 120.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigoAccent),
                strokeWidth: 8.0,
              ),
            ),
          ),
          SizedBox(
            height: 22.0,
          ),
          Text(
            message ?? 'Loading...',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      );
    });
  }
  void stop() {
    Navigator.pop(context);
  }

}
