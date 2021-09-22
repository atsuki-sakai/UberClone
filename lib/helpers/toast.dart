import 'package:flutter/material.dart';
import 'custom_alert_dialog.dart';

void toast({required BuildContext context, String msg = ""}) {
 showAlertDialog(context: context, title: Text(''), content: Text(msg), defaultActionText: 'OK');
}