import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:internship/injection.dart';
import 'package:internship/presentation/pages/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  runApp(MyApp());
}
