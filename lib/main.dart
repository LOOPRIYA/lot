import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lot/view/auth_view.dart';
import 'package:lot/view/main_screens/calendar_view.dart';

void main() {
  runApp(const MyApp());
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Auth());
  }
}
