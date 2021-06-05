import 'package:flutter/material.dart';
import 'package:shop_layout/components/appbar_custom.dart';
import 'package:shop_layout/components/grid_products.dart';
import 'package:shop_layout/models/cart_item.dart';

class HomeScreen extends StatelessWidget {

  static final List<CartItem> itens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppbarCustom(title: "Loja"),
        body: Column(
          children: [
            Row(
              children: [_dividerHome(30, 20), Text("Produtos"), _dividerHome(20, 30)],
            ),
            Flexible(
              child: GridProducts(),
            ),
          ],
        ));
  }

  Expanded _dividerHome(double left, double right) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: left, right: right, top: 10, bottom: 10),
        child: Divider(),
      ),
    );
  }
}
