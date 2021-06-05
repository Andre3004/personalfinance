import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackacom/models/ong.dart';

import 'detail_ong_screen.dart';


class GridOngs extends StatelessWidget {

  final List<Ong> ongs;

  GridOngs(this.ongs);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("ONGs", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), actions: [
        Image.asset("assets/logo3.png")
      ],),
      body: GridView.builder(
        itemCount: ongs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, indice) {
          final ong = ongs[indice];
          return Container(
            child: _ItemOngs(ong: ong),
          );
        },
      ),
    );
  }


}

class _ItemOngs extends StatelessWidget {
  final Ong? ong;

  _ItemOngs({this.ong});

  @override
  Widget build(BuildContext context) {

    if(ong ==  null) return Container();

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)]),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (contextRoute)=> DetailOng(this.ong)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('${ong!.pathFotoPrimaria}'),
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
                  ong!.nome,
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
