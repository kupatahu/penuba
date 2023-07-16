import 'package:flutter/material.dart';
import 'package:penuba/app.dart';
import 'package:penuba/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const App());
}
