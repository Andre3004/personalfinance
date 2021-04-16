import 'package:bytebank_provider_new/components/editor.dart';
import 'package:bytebank_provider_new/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String _titleAppBar = 'Bytebank';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: _dicaCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaDeposito(BuildContext context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (valor != null) {
      var saldo = Saldo(valor);

      Provider.of<Saldo>(context, listen: false).adiciona(valor);

      Navigator.pop(context, saldo);
    }
  }
}
