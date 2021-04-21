import 'package:shop_layout/models/movel.dart';

class CartItem {
  final int qtd;
  final Movel movel;

  CartItem({this.qtd, this.movel});

  @override
  String toString() {
    return 'CartItem{qtd: $qtd, movel: $movel}';
  }
}
