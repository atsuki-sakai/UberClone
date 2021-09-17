import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDialog({
  required BuildContext context,
  required Widget? title,
  required Widget content,
  Function? okAction,
}) {
  if (!Platform.isIOS) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: [
              if (okAction != null) ...{
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              },
              TextButton(
                onPressed: () {
                  if (okAction != null) {
                    okAction();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  } else {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              if (okAction != null) ...{
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              },
              TextButton(
                onPressed: () {
                  if (okAction != null) {
                    okAction();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}
