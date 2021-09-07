import 'package:flutter/material.dart';

Future<Widget?> buildProgressIndicator(BuildContext context) async {
  await Future.delayed(Duration(seconds: 0));
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(Duration(milliseconds: 600), () {
        Navigator.of(context).pop(true);
      });
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
