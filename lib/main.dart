import 'package:flutter/material.dart';
import 'package:dzikir_tasbih/app_state.dart';
import 'package:dzikir_tasbih/dzikir_pagi.dart';
import 'package:dzikir_tasbih/dzikir_petang.dart';
import 'package:dzikir_tasbih/splash_screen.dart';
import 'package:dzikir_tasbih/tasbih_digital.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/dzikir_pagi': (context) => dzikir_pagi(),
          '/dzikir_petang': (context) => dzikir_petang(),
          '/tasbih_digital': (context) => tasbih_digital(),
          // ... tambahkan rute lainnya jika diperlukan
        },
        home: SplashScreen(),
      ),
    );
  }
}
