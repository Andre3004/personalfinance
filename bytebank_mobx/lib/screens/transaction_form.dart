import 'dart:async';

import 'package:bytebank/components/progress.dart';
import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/components/transaction_auth_dialog.dart';
import 'package:bytebank/controllers/state_default.dart';
import 'package:bytebank/controllers/transaction_controller.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/contact/contact.dart';
import 'package:bytebank/models/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  late TransactionController controller;
  final _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller = TransactionController(_showMensage);

    return Scaffold(
      appBar: AppBar(
        title: Text('New transaction'),
      ),
      body: Observer(
        builder: (_) => stateManagement(controller.state) ?? Container(),
      ),
    );
  }

  Widget? stateManagement(StateDefaultEnum stateDefaultEnum) {
    var showScreen = stateDefaultEnum == StateDefaultEnum.start ||
        stateDefaultEnum == StateDefaultEnum.error ||
        stateDefaultEnum == StateDefaultEnum.sucess;
    return showScreen ? _buildScreen() : Progress();
  }

  Widget _buildScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.contact.name,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.contact.accountNumber.toString(),
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _valueController,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(labelText: 'Value'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text('Transfer'),
                  onPressed: () {
                    final double? value = double.tryParse(_valueController.text);
                    if (value == null) return;
                    _confirmSave(context, value);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _confirmSave(BuildContext context, double value) {
    showDialog(
      context: context,
      builder: (contextDialog) => TransactionAuthDialog(
        onConfirm: (String password) => controller.save(value, widget.contact, password),
      ),
    );
  }

  void _showMensage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {},
        ),
      ),
    );
  }
}
