import 'package:flutter/material.dart';
import 'package:ordenacoes/enum/enum_ordenacoes.dart';
import 'package:ordenacoes/app_store.dart';

class OrdenacoesStep extends StatelessWidget {

  final AppStore appStore;

  const OrdenacoesStep({Key? key, required this.appStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Escolha uma forma de ordenação para os números ",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),

        ...Ordenacoes.values.map((e) {
          return Expanded(
            child: Container(
              color: Ordenacoes.values.indexOf(e) % 2 == 0 ? Colors.white : Colors.black87,
              width: double.infinity,
              child: TextButton(
                onPressed: () => appStore.setOrdenacao(e),
                child: Text(
                  OrdenacoesConverter.toValue(e),
                  style: TextStyle(fontSize: 16, color: Ordenacoes.values.indexOf(e) % 2 == 0 ? Colors.black: Colors.white),
                ),
              ),
            ),
          );
        }).toList()

      ],
    );
  }
}
