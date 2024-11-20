import 'package:calculadora_creditos/providers/calculadora_provider.dart';
import 'package:calculadora_creditos/screens/tabla_cuotas_screen.dart';
import 'package:calculadora_creditos/widgets/background.dart';
import 'package:calculadora_creditos/widgets/card_container.dart';
import 'package:calculadora_creditos/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculadoraScreen extends StatelessWidget {
  const CalculadoraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            CardContainer(
                child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('Calcula Tu Venta',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                  create: (context) => CalculadoraProvider(),
                  child: const _Form(),
                ),
              ],
            )),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      )),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({super.key});

  @override
  Widget build(BuildContext context) {
    final calProvider = Provider.of<CalculadoraProvider>(context);

    return Form(
        key: calProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: Custominput.authInputDecoracion(
                hintText: 'Escriba el valor',
                labelText: 'Valor del Producto',
                prefixIcon: Icons.attach_money,
              ),
              onChanged: (value) {
                calProvider.valor = int.tryParse(value) ?? 0;
              },
              validator: (value) {
                final intValue = int.tryParse(value ?? '');
                if (intValue != null && intValue > 0) {
                  return null;
                }
                return 'Escriba el valor de producto';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            DropdownButtonFormField<int>(
              decoration: Custominput.authInputDecoracion(
                hintText: 'Seleccione el producto',
                labelText: 'Producto',
                prefixIcon: Icons.shopping_cart,
              ),
              value: [12, 15, 20].contains(calProvider.cuotas)
                  ? calProvider.cuotas
                  : null,
              items: const [
                DropdownMenuItem(value: 12, child: Text('Tenis triple AAA')),
                DropdownMenuItem(value: 15, child: Text('Tenis 1,1')),
                DropdownMenuItem(value: 20, child: Text('Tenis nacionales')),
                DropdownMenuItem(value: 20, child: Text('Ropa nacional')),
                DropdownMenuItem(value: 20, child: Text('Ropa triple AAA')),
                DropdownMenuItem(value: 20, child: Text('Ropa 1,1')),
              ],
              onChanged: (value) {
                calProvider.cuotas = value ?? 0;
              },
              validator: (value) {
                if (value != null && value > 0) {
                  return null;
                }
                return 'Seleccione el producto';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            DropdownButtonFormField<int>(
              decoration: Custominput.authInputDecoracion(
                hintText: 'Seleccione el tipo de venta',
                labelText: 'Tipo venta',
                prefixIcon: Icons.shopping_bag,
              ),
              value: [12, 15, 20].contains(calProvider.cuotas)
                  ? calProvider.cuotas
                  : null,
              items: const [
                DropdownMenuItem(value: 12, child: Text('Contado')),
                DropdownMenuItem(value: 15, child: Text('Credito')),
              ],
              onChanged: (value) {
                calProvider.cuotas = value ?? 0;
              },
              validator: (value) {
                if (value != null && value > 0) {
                  return null;
                }
                return 'Seleccione el tipo de venta';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: const Color.fromARGB(255, 40, 89, 135),
                    ),
                    const Text('Flete'),
                  ],
                ),
                const SizedBox(width: 30), // Espacio entre los dos checks
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      activeColor: const Color.fromARGB(255, 40, 89, 135),
                    ),
                    const Text('Descuento'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromARGB(255, 40, 89, 135),
                onPressed: calProvider.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!calProvider.isValidForm()) return;

                        calProvider.isLoading = true;

                        final resultado = calProvider.calcularCuotas(
                            calProvider.valor, calProvider.cuotas);

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TablaCuotasScreen(
                              cuotas: resultado.cuotas,
                              valorFinanciado: resultado.valorFinanciado,
                            ),
                          ),
                        );

                        calProvider.isLoading = false;
                      },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ));
  }
}
