
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

void showSnackBar(String message) {
  OneContext()
      .showSnackBar(builder: (context) => SnackBar(content: Text(message)));
}
