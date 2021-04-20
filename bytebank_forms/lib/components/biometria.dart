import 'package:bytebank_forms/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class Biometria extends StatelessWidget {
  final _autenticacaoLocal = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _existBiometris(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return SizedBox(
              child: ElevatedButton(
                  onPressed: () => _autenticarCliente(context),
                  child: Text("Habilitar biometria!")),
              width: double.infinity,
            );
          }

          return Container();
        });
  }

  Future<bool> _existBiometris() async {
    try {
      var teste = await _autenticacaoLocal.canCheckBiometrics;
      return teste;
    } on PlatformException catch (erro) {
      print(erro);
    }
  }

  Future<void> _autenticarCliente(context) async {
    bool autenticado = await _existBiometris();

    try {
      autenticado =  await _autenticacaoLocal.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          biometricOnly: true);
    } on PlatformException catch (e) {
      print(e);
      if (e.code == auth_error.notAvailable) {
        print("Entrou");
      }
    }



    //Provider.of<Cliente>(context).biometria = autenticado;
  }
}
