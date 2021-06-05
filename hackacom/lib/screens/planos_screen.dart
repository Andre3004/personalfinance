import 'package:flutter/material.dart';
import 'package:hackacom/widgets/credit_card.dart';

class PlanosScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Finalizar plano",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [Image.asset("assets/logo3.png")],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              "Programa de Benefícios",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).accentColor),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildContainer(
                    context,
                    "Anual",
                    "*15% de desconto",
                    "+800 pontos",
                    "R\$   9,90/Mês",
                  ),
                  _buildContainer(
                    context,
                    "Semestral",
                    "*10% de desconto",
                    "+300 pontos",
                    "R\$ 14,90/Mês",
                  ),
                  _buildContainer(
                    context,
                    "Trimestral",
                    "*5% de desconto",
                    "+100 pontos",
                    "R\$ 19,90/Mês",
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Detalhes",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).accentColor),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Assinando nosso Programa de Benefícios, além de apoiar nossas ONG's, você doador tem direito à produtos e descontos exclusivos (limitados*), e acumula pontos para trocar por produtos à sua escolha!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Você pode também obter pontos divulgando o trabalho de nossas ONG's nas redes sociais,  prestando serviços na própria instituição, participando de eventos online e presenciais, e até convidando um amigo para também tornar-se doador!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Text(
              "*Em empresas parceiras",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Theme.of(context).accentColor),
            )
          ],
        ),
      ),
    );
  }

  InkWell _buildContainer(
      BuildContext context, String titulo, String desconto, String pontos, String preco) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (contextRoute) => CreditCardScreen(titulo, preco)));
      },
      child: Container(
        height: 90,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12),
          ],
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Theme.of(context).accentColor,
              width: 3.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  desconto,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  pontos,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Row(
              children: [
                VerticalDivider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8),
                  child: Text(
                    preco,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
