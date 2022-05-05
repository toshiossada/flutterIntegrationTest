import 'package:flutter/material.dart';

Widget testableWidget(
  Widget? child, {
  NavigatorObserver? navigatorObserver,
  GlobalKey<NavigatorState>? navigatorKey,
}) =>
    MaterialApp(
      themeMode: ThemeMode.light,
      home: child,
      navigatorKey: navigatorKey,
    );
