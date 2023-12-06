import 'package:flutter/material.dart';
import 'package:tictactoe/app.dart';
import 'package:tictactoe/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}
