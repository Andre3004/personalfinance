import 'package:flutter/material.dart';
import 'package:shop_layout/components/cart_button.dart';

class AppbarCustom extends StatelessWidget with PreferredSizeWidget  {

  final String title;
  final bool showCart;


  AppbarCustom({this.title, this.showCart = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData( color: Colors.black),
      title: Text(title, style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        _showCart()
      ],
    );
  }

  StatelessWidget _showCart() => showCart ? CartButton() : Container();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
