import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shop_layout/components/appbar_custom.dart';
import 'package:shop_layout/controllers/cart_controller.dart';
import 'package:shop_layout/models/movel.dart';

class DetailScreen extends StatelessWidget {
  final Movel movel;

  DetailScreen({@required this.movel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/${movel.foto}'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppbarCustom(
          title: "Detalhes",
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(16),
            height: 200,
            child: _CardDetail(movel),
          ),
        ),
      ),
    );
  }
}

class _CardDetail extends StatelessWidget {

  final Movel movel;

  _CardDetail(this.movel);

  @override
  Widget build(BuildContext context) {
    final cartController =  Provider.of<CartController>(context);
    final format = Provider.of<NumberFormat>(context);


    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movel.titulo,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 16,
            ),
            Text(movel.descricao),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  format.format(movel.preco),
                  style: Theme.of(context).textTheme.headline1,
                ),
                TextButton(
                  onPressed: () => cartController.add(movel),
                  child: Text('Comprar', style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
