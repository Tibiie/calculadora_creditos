import 'package:flutter/material.dart';

class CalculadoraProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double valorOriginal = 0;
  int producto = 0;
  int tipoVenta = 0;
  bool? flete = false;
  double? valorFlete = 0;
  bool? descuento = false;
  double resultadoFInal = 0;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  calcularValorFinal() {
    double porcentajeVenta = 0;
    double valor = 0;

    valor = valorOriginal;

    if (flete == true) {
      valor = valor + valorFlete!;
      print(valor);
    }

    switch (producto) {
      case 1:
        if (tipoVenta == 1) {
          porcentajeVenta = 0.7;
          resultadoFInal = valor / porcentajeVenta;
        } else {
          porcentajeVenta = 0.55;
          if (descuento == true) {
            resultadoFInal = valor / (porcentajeVenta + 0.05);
          } else {
            resultadoFInal = valor / (porcentajeVenta);
          }
        }
        break;
      case 2:
        if (tipoVenta == 1) {
          porcentajeVenta = 0.7;
          resultadoFInal = valor / porcentajeVenta;
        } else {
          porcentajeVenta = 0.55;
          if (descuento == true) {
            resultadoFInal = valor / (porcentajeVenta + 0.05);
          } else {
            resultadoFInal = valor / (porcentajeVenta);
          }
        }
        break;
      case 3:
        if (tipoVenta == 1) {
          porcentajeVenta = 0.75;
          resultadoFInal = valor / porcentajeVenta;
        } else {
          porcentajeVenta = 0.6;
          if (descuento == true) {
            resultadoFInal = valor / (porcentajeVenta + 0.05);
          } else {
            resultadoFInal = valor / (porcentajeVenta);
          }
        }
        break;
      case 4:
        if (tipoVenta == 1) {
          porcentajeVenta = 0.75;
          resultadoFInal = valor / porcentajeVenta;
        } else {
          porcentajeVenta = 0.6;
          if (descuento == true) {
            resultadoFInal = valor / (porcentajeVenta + 0.05);
          } else {
            resultadoFInal = valor / (porcentajeVenta);
          }
        }
        break;
      case 5:
        if (tipoVenta == 1) {
          porcentajeVenta = 0.7;
          resultadoFInal = valor / porcentajeVenta;
        } else {
          porcentajeVenta = 0.55;
          if (descuento == true) {
            resultadoFInal = valor / (porcentajeVenta + 0.05);
          } else {
            resultadoFInal = valor / (porcentajeVenta);
          }
        }
        break;
      case 6:
        if (tipoVenta == 1) {
          porcentajeVenta = 0.7;
          resultadoFInal = valor / porcentajeVenta;
        } else {
          porcentajeVenta = 0.55;
          if (descuento == true) {
            resultadoFInal = valor / (porcentajeVenta + 0.05);
          } else {
            resultadoFInal = valor / (porcentajeVenta);
          }
        }
        break;

      default:
    }
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
