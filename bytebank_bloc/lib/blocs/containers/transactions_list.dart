import 'package:bytebank/components/container.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class TransactionsListContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return TransactionsListView();
  }
}
