import 'package:bytebank_provider_new/screens/dashboard/saldo_card.dart';
import 'package:bytebank_provider_new/screens/deposito/formulario.dart';
import 'package:bytebank_provider_new/screens/extrato/ultimas.dart';
import 'package:bytebank_provider_new/screens/transferencia/formulario.dart';
import 'package:bytebank_provider_new/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          UltimasTransferencias()
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            onPressed: () {
              MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                return ListaTransferencias();
              });
              Navigator.push(context, route);
            },
            child: Icon(Icons.list),
          ),
          FloatingActionButton(
            onPressed: () {
              MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                return FormularioDeposito();
              });
              Navigator.push(context, route);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                return FormularioTransferencia();
              });
              Navigator.push(context, route);
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
