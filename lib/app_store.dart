import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:ordenacoes/enum/enum_ordenacoes.dart';
import 'package:ordenacoes/enum/enum_tipo_entradas.dart';
import 'package:ordenacoes/enum/enum_etapas.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {

  @observable
  Etapas etapaAtual = Etapas.formaEntrada;

  TipoEntradas? entradaSelecionada;

  Ordenacoes? ordenacaoSelecionada;

  ObservableList<int> numeros = ObservableList<int>();

  List<int> temposDeExecucao = [];

  void addNumero(String? value) {
    if (value == null || value.isEmpty) {
      throw Exception("Digite um número válido!");
    }

    if (numeros.contains(int.parse(value))) {
      throw Exception("Esse número já está contido na lista");
    }

    numeros.add(int.parse(value));
  }

  void _gerarNumerosAleatorios() {
    numeros.clear();

    for (var i = 0; i <= 1000; i++) {
      var nextInt = Random().nextInt(1000000);
      if (!numeros.contains(nextInt)) {
        numeros.add(nextInt);
      }
    }
  }

  @action
  void setEntrada(TipoEntradas entrada) {
    entradaSelecionada = entrada;
    etapaAtual = Etapas.formaOrdenacao;
  }

  @action
  void setOrdenacao(Ordenacoes ordenacao) {
    ordenacaoSelecionada = ordenacao;
    etapaAtual = Etapas.digitacao;

    if (entradaSelecionada == TipoEntradas.aleatoria) {
      _gerarNumerosAleatorios();
    }
  }

  @action
  void reset() {
    ordenacaoSelecionada = null;
    entradaSelecionada = null;
    numeros.clear();
    temposDeExecucao.clear();
    etapaAtual = Etapas.formaEntrada;
  }

  @action
  void ordenar() {
    if (numeros.isEmpty || numeros.length == 1) {
      throw Exception("Para fazer a ordenar é necessário que a lista contenha no mínimo dois números!");
    }

    var d1 = DateTime.now().millisecondsSinceEpoch;
    _bubbleSort(numeros);
    temposDeExecucao.add(DateTime.now().millisecondsSinceEpoch - d1);

    var d2 = DateTime.now().millisecondsSinceEpoch;
    _insertionSort(numeros);
    temposDeExecucao.add(DateTime.now().millisecondsSinceEpoch - d2);

    var d3 = DateTime.now().millisecondsSinceEpoch;
    _mergeSort(numeros);
    temposDeExecucao.add(DateTime.now().millisecondsSinceEpoch - d3);

    var d4 = DateTime.now().millisecondsSinceEpoch;
    _quickSort(numeros);
    temposDeExecucao.add(DateTime.now().millisecondsSinceEpoch - d4);

    var d5 = DateTime.now().millisecondsSinceEpoch;
    _selectionSort(numeros);
    temposDeExecucao.add(DateTime.now().millisecondsSinceEpoch - d5);

    var d6 = DateTime.now().millisecondsSinceEpoch;
    _shellSort(numeros);
    temposDeExecucao.add(DateTime.now().millisecondsSinceEpoch - d6);

    etapaAtual = Etapas.ordenacao;
  }

  int get tempoDeExecucaoTotal {
    int tempodeExecucao = 0;

    for (var e in temposDeExecucao) {
      tempodeExecucao += e;
    }

    return tempodeExecucao > 1 ? tempodeExecucao : 1;
  }

  List<int> _bubbleSort(List<int> array) {
    List<int> bubbleArray = List.of(array);
    int tamanho = bubbleArray.length;
    for (int i = 0; i < tamanho - 1; i++) {
      for (int j = 0; j < tamanho - i - 1; j++) {
        if (bubbleArray[j] > bubbleArray[j + 1]) {
          int temp = bubbleArray[j];
          bubbleArray[j] = bubbleArray[j + 1];
          bubbleArray[j + 1] = temp;
        }
      }
    }

    return bubbleArray;
  }

  List<int> _insertionSort(List<int> array) {
    List<int> insertionArray = List.of(array);
    int tamanho = insertionArray.length;
    for (var i = 0; i < tamanho; i++) {
      for (var j = i; j > 0 && insertionArray[j] < insertionArray[j - 1]; j--) {
        final tmp = insertionArray[j];
        insertionArray[j] = insertionArray[j - 1];
        insertionArray[j - 1] = tmp;
      }
    }
    return insertionArray;
  }

  List<int> _mergeSort(List<int> array) {
    List<int> mergeArray = List.of(array);
    if (mergeArray.length <= 1) {
      return mergeArray;
    }

    int splitIndex = mergeArray.length ~/ 2;

    List<int> arrayDireita = _mergeSort(mergeArray.sublist(0, splitIndex));
    List<int> arrayEsquerda = _mergeSort(mergeArray.sublist(splitIndex));

    return merge(arrayEsquerda, arrayDireita);
  }

  List<int> merge(arrayEsquerda, arrayDireita) {
    List<int> result = [];
    int i = 0;
    int j = 0;

    while (i < arrayEsquerda.length && j < arrayDireita.length) {
      if (arrayEsquerda[i] <= arrayDireita[j]) {
        result.add(arrayEsquerda[i]);
        i++;
      } else {
        result.add(arrayDireita[j]);
        j++;
      }
    }

    while (i < arrayEsquerda.length) {
      result.add(arrayEsquerda[i]);
      i++;
    }

    while (j < arrayDireita.length) {
      result.add(arrayDireita[j]);
      j++;
    }
    return result;
  }

  List<int> _quickSort(List<int> array) {
    List<int> sortedArray = List.of(array);
    int tamanho = sortedArray.length;

    if (tamanho < 2) {
      return sortedArray;
    }

    final menor = sortedArray.where((value) => value.compareTo(sortedArray.first) < 0).toList();
    final igual = sortedArray.where((value) => value.compareTo(sortedArray.first) == 0).toList();
    final maior = sortedArray.where((value) => value.compareTo(sortedArray.first) > 0).toList();

    return [
      ..._quickSort(menor),
      ...igual,
      ..._quickSort(maior),
    ];
  }

  List<int> _selectionSort(array) {
    List<int> sortedArray = List.of(array);

    int tamanho = sortedArray.length;

    for (var i = 0; i < tamanho - 1; i++) {
      var indexMin = i;

      for (var j = i + 1; j < tamanho; j++) {
        if (sortedArray[j] < sortedArray[indexMin]) {
          indexMin = j;
        }
      }

      if (indexMin != i) {
        sortedArray[i] = sortedArray[indexMin];
        sortedArray[indexMin] = sortedArray[i];;
      }
    }

    return sortedArray;
  }

  List<int> _shellSort(List<int> array) {
    List<int> sortedArray = List.of(array);

    int arrayLength = sortedArray.length;

    int h = 1;

    do {
      h = 3 * h + 1;
    } while (h < arrayLength);

    do {
      h = (h / 3).truncate();
      for (int i = h; i < arrayLength; i++) {
        int temp = sortedArray[i];
        int j = i;
        while (sortedArray[j - h] > temp) {
          sortedArray[j] = sortedArray[j - h];
          j -= h;
          if (j < h) break;
        }
        sortedArray[j] = temp;
      }
    } while (h != 1);

    return sortedArray;
  }

}