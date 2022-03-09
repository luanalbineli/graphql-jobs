import 'package:flutter/material.dart';

extension StatelessWidgetExtensions on StatelessWidget {
  void showDefaultSnackBar(BuildContext context, String text) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final snackBar = SnackBar(
      content: Text(text),
    );

    scaffoldMessenger.clearSnackBars();
    scaffoldMessenger.showSnackBar(snackBar);
  }
}
