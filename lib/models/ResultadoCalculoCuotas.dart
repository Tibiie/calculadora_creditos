import 'package:calculadora_creditos/models/cuota.dart';

class ResultadoCalculoCuotas {
  final List<Cuota> cuotas;
  final double valorFinanciado;

  ResultadoCalculoCuotas({required this.cuotas, required this.valorFinanciado});
}
