// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on AppStoreBase, Store {
  late final _$etapaAtualAtom =
      Atom(name: 'AppStoreBase.etapaAtual', context: context);

  @override
  Etapas get etapaAtual {
    _$etapaAtualAtom.reportRead();
    return super.etapaAtual;
  }

  @override
  set etapaAtual(Etapas value) {
    _$etapaAtualAtom.reportWrite(value, super.etapaAtual, () {
      super.etapaAtual = value;
    });
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  void setEntrada(TipoEntradas entrada) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setEntrada');
    try {
      return super.setEntrada(entrada);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrdenacao(Ordenacoes ordenacao) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setOrdenacao');
    try {
      return super.setOrdenacao(ordenacao);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo =
        _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void ordenar() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.ordenar');
    try {
      return super.ordenar();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
etapaAtual: ${etapaAtual}
    ''';
  }
}
