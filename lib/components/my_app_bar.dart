import 'package:flutter/material.dart';

AppBar myOwnAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black),
  );
}
