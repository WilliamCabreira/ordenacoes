enum Ordenacoes {
  bubbleSort,
  insertionSort,
  mergeSort,
  quickSort,
  selectionSort,
  shellSort,
}

class OrdenacoesConverter {

  static const String _bubbleSort = "Bubble Sort";
  static const String _insertionSort = "Insertion Sort";
  static const String _mergeSort = "Merge Sort";
  static const String _quickSort = "Quick Sort";
  static const String _selectionSort = "Selection Sort";
  static const String _shellSort = "Shell Sort";

  static Ordenacoes toOrdenacoes(String ordenacao) {
    switch (ordenacao){
      case _bubbleSort:
        return Ordenacoes.bubbleSort;
      case _insertionSort:
        return Ordenacoes.insertionSort;
      case _mergeSort:
        return Ordenacoes.mergeSort;
      case _quickSort:
        return Ordenacoes.quickSort;
      case _selectionSort:
        return Ordenacoes.selectionSort;
      case _shellSort:
        return Ordenacoes.shellSort;
      default:
        throw Exception("Enum não encontrado");
    }
  }

  static String toValue(Ordenacoes ordenacao) {
    switch (ordenacao){
      case Ordenacoes.bubbleSort:
        return _bubbleSort;
      case Ordenacoes.insertionSort:
        return _insertionSort;
      case Ordenacoes.mergeSort:
        return _mergeSort;
      case Ordenacoes.quickSort:
        return _quickSort;
      case Ordenacoes.selectionSort:
        return _selectionSort;
      case Ordenacoes.shellSort:
        return _shellSort;
    }
  }

}