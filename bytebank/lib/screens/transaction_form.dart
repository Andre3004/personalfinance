import 'dart:async';

import 'package:bytebank/components/progress.dart';
import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/components/transaction_auth_dialog.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/contact/contact.dart';
import 'package:bytebank/models/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();
  final String transactionId = Uuid().v4();

  bool _sending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(child: Progress(message: 'Sending...',), visible: _sending,),
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
                    onPressed: () => _showDialog(context),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (contextDialog) => TransactionAuthDialog(
              onConfirm: (String password) {
                final double? value = double.tryParse(_valueController.text);
                if(value == null) return;
                final transactionCreated = Transaction(transactionId, value, widget.contact, null);
                _save(transactionCreated, password, context);
              },
            ));
  }

  void _save(Transaction transactionCreated, String password, BuildContext context) async {
    await _send(transactionCreated, password, context);

    _showSuccessfulMessage(context);
  }

  Future _showSuccessfulMessage(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return SuccessDialog('successful transaction');
        });
    Navigator.pop(context);
  }

  void _showFailureMessage(BuildContext context, {String message = 'Unkown error'}) {
    showDialog(
        context: context,
        builder: (contextDialog) {
          return FailureDialog(message);
        });
  }

  Future<Transaction?> _send(
      Transaction transactionCreated, String password, BuildContext context) async {

    _toogleSending();
    final Transaction? transaction =
        await _webClient.save(transactionCreated, password).catchError((e) {
      _showFailureMessage(context, message: e.message);
    }, test: (e) => e is HttpException).catchError((e) {
      _showFailureMessage(context, message: 'timeout submitting the transaction');
    }, test: (e) => e is TimeoutException).catchError((e) {
          _showFailureMessage(context);
    }).whenComplete(() => _toogleSending());
    return transaction;
  }
  
  
  void _toogleSending()
  {
    setState(() {
      _sending = !_sending;
    });
  }
}
