import 'package:calculadora_creditos/widgets/background.dart';
import 'package:calculadora_creditos/widgets/card_container.dart';
import 'package:calculadora_creditos/widgets/custom_input.dart';
import 'package:flutter/material.dart';

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
                const _Form()
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
    return Container(
      child: Form(
          key: key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: Custominput.authInputDecoracion(
                  hintText: '100000',
                  labelText: 'Valor del Producto',
                  prefixIcon: Icons.attach_money,
                ),
                // onChanged: ( value ) => loginForm.email = value,
                // validator: ( value )  {
                //   String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //   RegExp regExp  = RegExp(pattern);

                //   return regExp.hasMatch(value ?? '')
                //     ? null
                //     : 'El valor ingresado no es un correo';
                // },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: Custominput.authInputDecoracion(
                  hintText: 'Número de Cuotas',
                  labelText: '12',
                  prefixIcon: Icons.payment,
                ),
                // onChanged: ( value ) => loginForm.password = value,
                // validator: ( value )  {
                //   if ( value != null && value.length >= 6 ) return null;
                //   return 'La contraseña debe de tener minimo 6 caracteres';
                // },
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
                  // onPressed: loginForm.isLoading ? null : () async {

                  //   FocusScope.of(context).unfocus();

                  //   if(!loginForm.isValidForm()) return;

                  //   loginForm.isLoading = true;

                  //   await Future.delayed(Duration(seconds: 2));

                  //   loginForm.isLoading = false;

                  //   Navigator.pushReplacementNamed(context, 'home');
                  // },
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home');
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
