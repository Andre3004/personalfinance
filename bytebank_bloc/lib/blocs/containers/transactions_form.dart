import 'package:bytebank/blocs/cubits/transaction_form.dart';
import 'package:bytebank/components/container.dart';
import 'package:bytebank/models/contact/contact.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionFormContainer extends BlocContainer {
  final Contact _contact;

  TransactionFormContainer(this._contact);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionFormCubit>(create: (BuildContext context) {
      return TransactionFormCubit();
    }, child: BlocListener<TransactionFormCubit, TransactionFormState>(
      listener: (context, state) {
        if (state is SentState) {
          Navigator.pop(context);
        }
      },
      child: TransactionFormView(_contact),
    ));
  }
}
