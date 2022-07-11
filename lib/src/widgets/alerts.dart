import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert ErrorAlert(context, errorMessage) {
  return Alert(
    context: context,
    type: AlertType.error,
    title: "Error",
    desc: errorMessage,
    buttons: [
      DialogButton(
        color: Colors.red[300],
        child: const Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  );
}

Alert InformationAlert(context, infoMessage) {
  return Alert(
    context: context,
    type: AlertType.info,
    title: "Information",
    desc: infoMessage,
    buttons: [
      DialogButton(
        color: Colors.blue[300],
        child: const Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  );
}
