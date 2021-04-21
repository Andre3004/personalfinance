import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_layout/components/appbar_custom.dart';
import 'package:shop_layout/controllers/cart_controller.dart';
import 'package:shop_layout/models/movel.dart';

class CartDetailScreen extends StatefulWidget {
  @override
  _CartDetailScreenState createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<CartController>(context);
    final format = Provider.of<NumberFormat>(context);

    return Scaffold(
        appBar: AppbarCustom(
          title: "Carrinho",
          showCart: false,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)],
              color: Colors.white),
          height: 80,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: ', style: Theme.of(context).textTheme.headline3),
              Observer(
                builder: (_) {
                  return Text('${format.format(controller.valorTotal)}',
                      style: Theme.of(context).textTheme.headline3);
                },
              ),
            ],
          ),
        ),
        body: controller.moveis.isEmpty
            ? Container(
                height: double.infinity,
                alignment: Alignment.center,
                child: Text("Nenhum Item no carrinho!"),
              )
            : _ListCartItens(context));
  }

  Widget _ListCartItens(BuildContext context) {
    var controller = Provider.of<CartController>(context);
    final format = Provider.of<NumberFormat>(context);

    return Observer(
      builder: (_) {
        var moveis = controller.moveis;

        return ListView.builder(
          itemCount: moveis.length,
          itemBuilder: (_, indice) {
            var movel = moveis[indice];

            return Container(
              margin: EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    Expanded(
                      child: Image(
                        height: 92,
                        image: AssetImage(
                          'assets/images/${movel.foto}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 92,
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movel.titulo,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${format.format(movel.preco)}'),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          movel.quantidade++;
                                          controller.updateAll();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.add,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                    Text('${movel.quantidade}'),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (movel.quantidade == 1) {
                                            controller.remove(movel);
                                            return;
                                          }
                                          movel.quantidade--;
                                          controller.updateAll();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.remove,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
