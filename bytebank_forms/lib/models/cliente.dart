
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cliente extends ChangeNotifier{

  String _nome;
  String _email;
  String _celular;
  String _cpf;
  String _nascimento;
  String _cep;
  String _estado;
  String _cidade;
  String _bairro;
  String _logradouro;
  String _numero;
  String _senha;
  int _stepAtual = 0;
  File _imagemRg = null;
  bool _biometria;


  bool get biometria => _biometria;

  set biometria(bool value) {
    _biometria = value;
  }

  File get imagemRg => _imagemRg;

  set imagemRg(File value) {
    _imagemRg = value;
    notifyListeners();
  }

  int get stepAtual => _stepAtual;

  set stepAtual(int value) {
    _stepAtual = value;
    notifyListeners();
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
    notifyListeners();
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get numero => _numero;

  set numero(String value) {
    _numero = value;
  }

  String get logradouro => _logradouro;

  set logradouro(String value) {
    _logradouro = value;
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;
  }

  String get cidade => _cidade;

  set cidade(String value) {
    _cidade = value;
  }

  String get estado => _estado;

  set estado(String value) {
    _estado = value;
  }

  String get cep => _cep;

  set cep(String value) {
    _cep = value;
  }

  String get nascimento => _nascimento;

  set nascimento(String value) {
    _nascimento = value;
  }

  String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;
  }

  String get celular => _celular;

  set celular(String value) {
    _celular = value;
  }
}