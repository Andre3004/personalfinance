// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionController on TransactionControllerBase, Store {
  final _$stateAtom = Atom(name: 'TransactionControllerBase.state');

  @override
  StateDefaultEnum get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StateDefaultEnum value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$findAllAsyncAction = AsyncAction('TransactionControllerBase.findAll');

  @override
  Future findAll() {
    return _$findAllAsyncAction.run(() => super.findAll());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
