import 'package:flutter/material.dart';
import 'package:ordenacoes/enum/enum_tipo_entradas.dart';
import 'package:ordenacoes/app_store.dart';

class EntradasStep extends StatelessWidget {

  final AppStore appStore;

  const EntradasStep({Key? key, required this.appStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Escolha uma forma de geração para os números ",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => appStore.setEntrada(TipoEntradas.manual),
              child: const Text(
                "Manual",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.black87,
            child: TextButton(
              onPressed: () => appStore.setEntrada(TipoEntradas.aleatoria),
              child: const Text(
                "Aleatória",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
