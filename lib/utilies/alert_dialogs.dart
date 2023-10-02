import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents dismissing the dialog when tapping outside
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(), // Use any loading indicator widget you prefer
      );
    },
  );
}