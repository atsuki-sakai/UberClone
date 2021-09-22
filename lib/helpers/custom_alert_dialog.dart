import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  required Widget title,
  required Widget content,
  required String defaultActionText,
  String? cancelActionText,
  VoidCallback? action,
}) async {
  if (!Platform.isIOS) {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: [
              if (cancelActionText != null) ...{
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(cancelActionText),
                ),
              },
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if(action != null){
                    action();
                  }
                },
                child: Text(defaultActionText),
              ),
            ],
          );
        });
  } else {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: [
            if (cancelActionText != null) ...{
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(cancelActionText),
              ),
            },
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if(action != null){
                  action();
                }
              },
              child: Text(defaultActionText),
            ),
          ],
        );
      },
    );
  }
}
