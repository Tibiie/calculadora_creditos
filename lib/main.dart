import 'package:calculadora_creditos/screens/tabla_cuotas_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_creditos/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      initialRoute: 'calculadora',
      routes: {
        'calculadora': (_) => const CalculadoraScreen(),
        'tabla': (_) => const TablaCuotasScreen(
              cuotas: [],
              valorFinanciado: 0,
            )
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(
              elevation: 0,
              centerTitle: true,
              color: Color.fromARGB(255, 149, 10, 0)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromARGB(255, 149, 10, 0), elevation: 0)),
    );
  }
}
