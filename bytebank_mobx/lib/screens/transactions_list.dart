import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/controllers/state_default.dart';
import 'package:bytebank/controllers/transaction_controller.dart';
import 'package:bytebank/models/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {

  final controller = TransactionController(null);



  @override
  void initState() {
    controller.findAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: Observer(
        builder: (_) => stateManagement(controller.state),
      ),
    );
  }

  Widget stateManagement(StateDefaultEnum stateDefaultEnum) {
    switch (stateDefaultEnum) {
      case StateDefaultEnum.start:
        return Container();
      case StateDefaultEnum.loading:
        return Progress();
      case StateDefaultEnum.error:
        return _error();
      case StateDefaultEnum.sucess:
        return _buildScreen();
      default:
        return Container();
    }
  }

  Widget _buildScreen() {
    if (controller.transactions.isEmpty) {
      return _isEmpty();
    }

    return ListView.builder(
      itemCount: controller.transactions.length,
      itemBuilder: (context, index) {
        final Transaction transaction = controller.transactions[index];
        return Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(
              transaction.value.toString(),
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              transaction.contact.accountNumber.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        );
      },
    );
  }

  CenteredMessage _isEmpty() {
    return CenteredMessage("Nenhuma transação encontrada", icon: Icons.warning);
  }

  Widget _error() {
    return CenteredMessage("Erro desconhecido.");
  }
}
