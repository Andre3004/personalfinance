import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuvigator/nuvigator.dart';
import 'package:shop_layout/mock/mock_service.dart';
import 'package:shop_layout/models/movel.dart';
import 'package:shop_layout/navigation/main_router.dart';

class GridProducts extends StatelessWidget {
  final _mock = MockService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movel>>(
      future: _mock.getMoveis(),
      initialData: [],
      builder: (context, data) {
        final moveis = data.data;
        return GridView.builder(
          itemCount: moveis.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, indice) {
            final movel = moveis[indice];

            return Container(
              child: _ItemProducts(movel: movel),
            );
          },
        );
      },
    );
  }
}

class _ItemProducts extends StatelessWidget {
  final Movel movel;

  _ItemProducts({this.movel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)]),
      child: InkWell(
        onTap: () => NuRouter.of<MainRouter>(context).toDetail(movel: movel),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/${movel.foto}'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Theme.of(context).primaryColor,
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Text(
                  movel.titulo,
                  style: Theme.of(context).textTheme.headline2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
