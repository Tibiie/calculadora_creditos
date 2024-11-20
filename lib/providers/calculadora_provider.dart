import 'package:flutter/material.dart';

class CalculadoraProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int valor = 0;
  int producto = 0;
  int tipoVenta = 0;
  bool? flete = false;
  int? valorFlete = 0;
  bool? descuento = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int resultadoFInal = 0;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void toggleFlete(bool? value) {
    flete = value;
    notifyListeners();
  }

  void toggleDescuento(bool? value) {
    descuento = value;
    notifyListeners();
  }

  int calcularValorFinal(
      int valorProducto, int producto, int tipoVenta, int flete) {
    switch (producto) {
      case 1:
        break;
      default:
    }

    return 0;
  }

  // // Método para calcular las cuotas (colócalo en tu Provider o en otro lugar)
  // ResultadoCalculoCuotas calcularCuotas(int total, int cuotas) {
  //   List<Cuota> listaCuotas = [];

  //   double valorFinanciado = 0;

  //   double porcentaje = 0;

  //   if (cuotas == 12) {
  //     porcentaje = 0.64;
  //   } else if (cuotas == 15) {
  //     porcentaje = 0.55;
  //   } else if (cuotas == 20) {
  //     porcentaje = 0.5;
  //   }

  //   // Calcular el valor financiado
  //   valorFinanciado = total / porcentaje;

  //   // Calcular el valor de cada cuota
  //   double valorCuota = valorFinanciado / cuotas;

  //   // Generar la lista de cuotas
  //   for (int i = 1; i <= cuotas; i++) {
  //     listaCuotas.add(Cuota(numeroCuotas: i, valorCuota: valorCuota));
  //   }

  //   return ResultadoCalculoCuotas(
  //       cuotas: listaCuotas, valorFinanciado: valorFinanciado);
  // }
}
