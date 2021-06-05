import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shop_layout/models/movel.dart';

class MockService {
  final Client client = Client();

  Future<List<Movel>> getMoveis() async {
    final List<dynamic> data = jsonDecode(await rootBundle.loadString('assets/data/moveis.json'));
    return data
        .map(
          (dynamic json) => Movel.fromJson(json),
        )
        .toList();
  }
}
