import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    var response = await client.get(baseUri);
    return _toTransactions(response);
  }

  Future<Transaction?> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUri,
        headers: {'Content-type': 'application/json', 'password': password}, body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {

    if(_statusCodeResponses.containsKey(statusCode))
      return _statusCodeResponses[statusCode]!;

    return "Unknown error";
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
    409: 'transaction always exists',
  };

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map(
          (dynamic json) => Transaction.fromJson(json),
        )
        .toList();
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
