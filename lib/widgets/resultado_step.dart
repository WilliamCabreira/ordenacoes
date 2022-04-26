import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ordenacoes/enum/enum_ordenacoes.dart';
import 'package:ordenacoes/app_store.dart';

class ResultadoStep extends StatelessWidget {

  final AppStore appStore;

  const ResultadoStep({
    Key? key,
    required this.appStore
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tempo de execução total: ${appStore.tempoDeExecucaoTotal}ms"),
        const SizedBox(height: 18),
        ...Ordenacoes.values.map((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                      "${OrdenacoesConverter.toValue(e)}: ${appStore.temposDeExecucao[Ordenacoes.values.indexOf(e)]}ms ",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                      ),
                  ),

                  if (e == appStore.ordenacaoSelecionada!)
                    const Icon(Icons.check, color: Colors.green)

                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Container(
                height: 38,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * (appStore.temposDeExecucao[Ordenacoes.values.indexOf(e)] / appStore.tempoDeExecucaoTotal),
                color: Colors.primaries[Random().nextInt(Colors.accents.length)],
              ),
            ],
          );
        }).toList()
      ],
    );
  }
}
