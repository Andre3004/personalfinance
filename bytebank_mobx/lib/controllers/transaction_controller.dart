import 'dart:async';

import 'package:bytebank/controllers/state_default.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/contact/contact.dart';
import 'package:bytebank/models/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'transaction_controller.g.dart';

class TransactionController = TransactionControllerBase with _$TransactionController;

abstract class TransactionControllerBase with Store {
  final TransactionWebClient _webClient = TransactionWebClient();
  final String transactionId = Uuid().v4();
  String? errorMensagem;

  final void Function(String)? showMensagemCallBack;

  @observable
  StateDefaultEnum state = StateDefaultEnum.start;

  final transaction = null;

  List<Transaction> transactions = [];

  TransactionControllerBase(this.showMensagemCallBack);

  @action
  findAll() async {
    this.state = StateDefaultEnum.loading;
    try {
      transactions = await _webClient.findAll();
      this.state = StateDefaultEnum.sucess;
    } catch (e) {
      this.state = StateDefaultEnum.error;
    }
  }

  Future<Transaction?> save(double value, Contact contact, String password) async {
    state = StateDefaultEnum.loading;

    var transactionCreated = Transaction(transactionId, value, contact, null );

    try {
      await _webClient.save(transactionCreated, password);
      state = StateDefaultEnum.sucess;
      showMensagemCallBack!("Salvo com sucesso");
    } catch (e) {
      if (e is HttpException) errorMensagem = e.message;
      if (e is TimeoutException) errorMensagem = "Timeout mensagem error";
      if (e is Exception) errorMensagem = "Default mensagem error";
      showMensagemCallBack!(errorMensagem!);
      state = StateDefaultEnum.error;
    }
  }
}
