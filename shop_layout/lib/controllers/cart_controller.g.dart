// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??=
          Computed<int>(() => super.total, name: '_CartControllerBase.total'))
      .value;
  Computed<double> _$valorTotalComputed;

  @override
  double get valorTotal =>
      (_$valorTotalComputed ??= Computed<double>(() => super.valorTotal,
              name: '_CartControllerBase.valorTotal'))
          .value;

  final _$moveisAtom = Atom(name: '_CartControllerBase.moveis');

  @override
  ObservableList<Movel> get moveis {
    _$moveisAtom.reportRead();
    return super.moveis;
  }

  @override
  set moveis(ObservableList<Movel> value) {
    _$moveisAtom.reportWrite(value, super.moveis, () {
      super.moveis = value;
    });
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void add(Movel movel) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.add');
    try {
      return super.add(movel);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Movel movel) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.remove');
    try {
      return super.remove(movel);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAll() {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.updateAll');
    try {
      return super.updateAll();
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moveis: ${moveis},
total: ${total},
valorTotal: ${valorTotal}
    ''';
  }
}
