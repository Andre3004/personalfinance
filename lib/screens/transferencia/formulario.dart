import 'package:flutter/material.dart';
import 'package:personalfinance/components/editor.dart';
import 'package:personalfinance/models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              _controladorCampoNumeroConta,
              _rotuloCampoNumeroConta,
              _dicaCampoNumeroConta,
            ),
            Editor(
              _controladorCampoValor,
              _rotuloCampoValor,
              _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _createTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransferencia(BuildContext context) {
    double? numeroConta =
        double.tryParse(this._controladorCampoNumeroConta.text);
    double? campoValor = double.tryParse(this._controladorCampoValor.text);

    if (numeroConta != null && campoValor != null) {
      var transferenciaSaved = Transferencia(numeroConta, campoValor);
      Navigator.pop(context, transferenciaSaved);
    }
  }
}
