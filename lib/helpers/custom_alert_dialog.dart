import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO - doneActionはrequireしない
void showAlertDialog({required BuildContext context,required Widget title, required Widget content,required Function doneAction}) {
  if (!Platform.isIOS) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: title,
        content: content,
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Cancel'),),
          TextButton(onPressed: () {
            doneAction();
          }, child: Text('OK'),),
        ],
      );
    });
  } else {
    showCupertinoDialog(context: context, builder: (context) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Cancel'),),
          TextButton(onPressed: () {
            doneAction();
          }, child: Text('OK'),),
        ],
      );
    });
  }
}
