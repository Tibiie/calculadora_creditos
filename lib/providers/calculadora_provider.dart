import 'package:calculadora_creditos/models/cuota.dart';
import 'package:flutter/material.dart';

class CalculadoraProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int valor = 0;
  int cuotas = 0;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Método para calcular las cuotas (colócalo en tu Provider o en otro lugar)
  List<Cuota> calcularCuotas(int total, int cuotas) {
    List<Cuota> listaCuotas = [];

    double porcentaje = 0;

    if (cuotas == 12) {
      porcentaje = 0.66;
    } else if (cuotas == 15) {
      porcentaje = 0.55;
    } else if (cuotas == 24) {
      porcentaje = 0.5;
    }

    // Calcular el valor financiado
    double valorFinanciado = total / porcentaje;

    // Calcular el valor de cada cuota
    double valorCuota = valorFinanciado / cuotas;

    // Generar la lista de cuotas
    for (int i = 1; i <= cuotas; i++) {
      listaCuotas.add(Cuota(numeroCuotas: i, valorCuota: valorCuota));
    }

    return listaCuotas;
  }
}
