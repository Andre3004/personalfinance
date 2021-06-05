import 'dart:async';

import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/transaction/transaction.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionFormCubit extends Cubit<TransactionFormState> {
  TransactionFormCubit() : super(ShowFormState());

  void save(Transaction transactionCreated, String password, BuildContext context) async {
    emit(SendingState());

    _send(transactionCreated, password, context);
  }

  void _send(Transaction transactionCreated, String password, BuildContext context) async {
    final TransactionWebClient _webClient = TransactionWebClient();

    await _webClient
        .save(transactionCreated, password)
        .then(
          (e) => emit(SentState()),
        )
        .catchError((e) {
      emit(
        FatalErrorTransactionListState(e.message),
      );
    }, test: (e) => e is HttpException).catchError((e) {
      emit(
        FatalErrorTransactionListState('timeout submitting the transaction'),
      );
    }, test: (e) => e is TimeoutException).catchError((e) {
      emit(
        FatalErrorTransactionListState(""),
      );
    });
  }
}
