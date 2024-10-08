import 'package:calculadora_creditos/models/cuota.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TablaCuotasScreen extends StatelessWidget {
  final List<Cuota> cuotas;
  final double valorFinanciado;

  const TablaCuotasScreen(
      {super.key, required this.cuotas, required this.valorFinanciado});

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'es_CO', symbol: '\$', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cuotas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              DataTable(
                columns: const [
                  DataColumn(label: Center(child: Text('Número de Cuota'))),
                  DataColumn(label: Center(child: Text('Valor de Cuota'))),
                ],
                rows: cuotas
                    .map(
                      (cuota) => DataRow(
                        cells: [
                          DataCell(
                              Center(child: Text('${cuota.numeroCuotas}'))),
                          DataCell(
                              Text(currencyFormat.format(cuota.valorCuota))),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20), // Espacio entre la tabla y el total
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total Valor Financiado: ${currencyFormat.format(valorFinanciado)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: const Color.fromARGB(255, 149, 10, 0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: const Text(
                      'Volver',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
