import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/screens/expense_dashboard.dart';
import 'package:expense_tracker/services/theme/dark.dart';
import 'package:expense_tracker/services/theme/light.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: light,
      darkTheme: dark,
      home: const ExpenseDashboard(),
    );
  }
}

