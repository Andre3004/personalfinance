import 'package:bytebank_forms/models/cliente.dart';
import 'package:bytebank_forms/screens/autenticacao/login.dart';
import 'package:bytebank_forms/screens/dashboard/saldo.dart';
import 'package:bytebank_forms/screens/deposito/formulario.dart';
import 'package:bytebank_forms/screens/extrato/ultimas.dart';
import 'package:bytebank_forms/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => Login()), (route) => false),
            icon: Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<Cliente>(builder: (context, cliente, child) {
              if (cliente.nome == null)
                return Text(
                  'Olá o seu saldo é:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                );

              final String nome = cliente.nome;

              return Text(
                'Olá $nome o seu saldo é:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              );
            }),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Recebe valor'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FormularioDeposito();
                    }),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Nova Transferência'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FormularioTransferencia();
                    }),
                  );
                },
              ),
            ],
          ),
          UltimasTransferencias(),
        ],
      ),
    );
  }
}
