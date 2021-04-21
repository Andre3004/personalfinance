import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nuvigator/nuvigator.dart';
import 'package:provider/provider.dart';
import 'package:shop_layout/controllers/cart_controller.dart';
import 'package:shop_layout/navigation/main_router.dart';
import 'package:badges/badges.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return GestureDetector(
      onTap: () => NuRouter.of<MainRouter>(context).toCart(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
        ),
        alignment: Alignment.centerRight,
        height: 40,
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Observer(
          builder: (_) {
            return Badge(
              animationType: BadgeAnimationType.scale,
              badgeContent: Text(
                cartController.total.toString(),
                style: TextStyle(color: Colors.white),
              ),
              badgeColor: Theme.of(context).primaryColor,
              showBadge: cartController.total > 0,
              child: Image(
                height: 40,
                image: AssetImage('assets/images/carrinho.png'),
              ),
            );
          },
        ),
      ),
    );
  }
}
