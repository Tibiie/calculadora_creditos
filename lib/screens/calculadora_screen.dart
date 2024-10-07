import 'package:calculadora_creditos/providers/calculadora_provider.dart';
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
                Text('Calcula Tu Crédito',
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

    return Container(
      child: Form(
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
                  hintText: 'Seleccione el número de cuotas',
                  labelText: 'Número de Cuotas',
                  prefixIcon: Icons.payment,
                ),
                value: [12, 15, 20].contains(calProvider.cuotas)
                    ? calProvider.cuotas
                    : null,
                items: const [
                  DropdownMenuItem(value: 12, child: Text('12 cuotas')),
                  DropdownMenuItem(value: 15, child: Text('15 cuotas')),
                  DropdownMenuItem(value: 20, child: Text('20 cuotas')),
                ],
                onChanged: (value) {
                  calProvider.cuotas = value ?? 0;
                },
                validator: (value) {
                  if (value != null && value > 0) {
                    return null;
                  }
                  return 'Seleccione el número de cuotas';
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: const Color.fromARGB(255, 149, 10, 0),
                  onPressed: calProvider.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          if (!calProvider.isValidForm()) return;

                          calProvider.isLoading = true;

                          await Future.delayed(const Duration(seconds: 2));

                          calProvider.isLoading = false;

                          print("Formulario validado");
                        },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          )),
    );
  }
}
