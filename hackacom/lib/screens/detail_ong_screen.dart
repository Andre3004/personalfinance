import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackacom/models/ong.dart';
import 'package:hackacom/screens/planos_screen.dart';

class DetailOng extends StatelessWidget {
  final Ong? ong;

  DetailOng(this.ong);

  @override
  Widget build(BuildContext context) {

    if(this.ong == null) return Container();

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da ONG", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),actions: [
        Image.asset("assets/logo3.png")
      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 200.0, viewportFraction: 0.5, enlargeCenterPage: true),
              items: ong!.pathsFotos.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(image,);
                  },
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Proposta da ONG",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                      Text(
                        ong!.proposta,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_location, color: Theme.of(context).accentColor),
                              Text(
                                "Localização:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(
                            ong!.localizacao,
                            style: TextStyle(color: Colors.grey[800]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_list_bulleted, color: Theme.of(context).accentColor),
                              Text(
                                "Categoria:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(
                            ong!.categoria,
                            style: TextStyle(color: Colors.grey[800]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.people, color: Theme.of(context).accentColor),
                          Text(
                            "Apoiadores",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: this.ong!.apoiadores.map((apoiador) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(300.0),
                                      child: Image.asset(
                                          apoiador,
                                          width: 100.0),
                                    ),

                                  ],
                                ),
                              );
                            }).toList()
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: (){},
              heroTag: null,
              child: Icon(Icons.share),
            ),
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => PlanosScreen()));
              },
              heroTag: null,
              child: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
