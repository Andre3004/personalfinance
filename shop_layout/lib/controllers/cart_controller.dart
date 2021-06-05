import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../models/movel.dart';

part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  ObservableList<Movel> moveis = ObservableList();

  @computed
  int get total {
    if (moveis.isEmpty) return 0;
    return moveis.map((element) => element.quantidade).reduce((a, b) => a + b);
  }

  @computed
  double get valorTotal {
    if (moveis.isEmpty) return 0;
    return moveis.map((element) => element.quantidade * element.preco).reduce((a, b) => a + b);
  }

  @action
  void add(Movel movel) {
    if (moveis.map((element) => element.titulo).contains(movel.titulo)) {
      movel.quantidade++;
      moveis = [...moveis].asObservable();
      return;
    }
    moveis.add(movel);
  }

  @action
  void remove(Movel movel) {
    moveis.remove(movel);
  }

  @action
  void updateAll() {
    moveis = [...moveis].asObservable();
  }
}
