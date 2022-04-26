import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ordenacoes/enum/enum_etapas.dart';
import 'package:ordenacoes/app_store.dart';
import 'package:ordenacoes/widgets/digitacao_step.dart';
import 'package:ordenacoes/widgets/ordenacoes_step.dart';
import 'package:ordenacoes/widgets/resultado_step.dart';

import 'widgets/entradas_step.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  late TextEditingController numeroController;
  late AppStore store;

  @override
  void initState() {
    super.initState();
    numeroController = TextEditingController();
    store = AppStore();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ordenações"),
          actions: [
            IconButton(onPressed: () => store.reset(), icon: const Icon(Icons.refresh))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Observer(
            builder: (BuildContext context) {
              switch (store.etapaAtual) {
                case Etapas.formaEntrada:
                  return EntradasStep(appStore: store);
                case Etapas.formaOrdenacao:
                  return OrdenacoesStep(appStore: store);
                case Etapas.digitacao:
                  return DigitacaoStep(appStore: store, numeroController: numeroController);
                case Etapas.ordenacao:
                  return ResultadoStep(appStore: store);
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }
}
