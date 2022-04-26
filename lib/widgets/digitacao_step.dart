import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ordenacoes/app_store.dart';

class DigitacaoStep extends StatelessWidget {

  final TextEditingController numeroController;
  final AppStore appStore;

  const DigitacaoStep({Key? key, required this.appStore, required this.numeroController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  keyboardType: TextInputType.number,
                  controller: numeroController,
                  onFieldSubmitted: (s) {
                    try {
                      appStore.addNumero(s);
                      numeroController.clear();
                    } catch (e, s) {
                      _showDialog(context, e.toString());
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: "Digite o número"
                  )
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 40)
                    )
                ),
                onPressed: () {
                  try {
                    appStore.addNumero(numeroController.text);
                    numeroController.clear();
                  } catch (e) {
                    _showDialog(context, e.toString());
                  }
                },
                child: const Text("Inserir número"),
              ),

            ],
          ),
          const SizedBox(height: 32),
          Text("Sua lista de número contém ${appStore.numeros.length} número(s): ", style: const TextStyle(fontSize: 18),),
          const SizedBox(height: 18),
          SizedBox(
            height: MediaQuery.of(context).size.height * .5 - 40,
            child: Scrollbar(
              child: Observer(
                builder: (context) {
                  return GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 60,
                    ),
                    itemCount: appStore.numeros.length,
                    itemBuilder: (context, index) {
                      return Text(
                        appStore.numeros[index].toString(),
                        style: const TextStyle(fontSize: 14),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 40)
                )
            ),
            onPressed: () {
              try {
                appStore.ordenar();
              } catch (e) {
                _showDialog(context, e.toString());
              }
            },
            child: const Text("Ordenar"),
          ),
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context, String mensagem) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Erro"),
        content: Text(mensagem.replaceAll("Exception: ", "")),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("Ok"))
        ],
      );
    },
  );
}
