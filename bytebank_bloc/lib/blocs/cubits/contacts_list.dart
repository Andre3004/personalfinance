import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsListCubit extends Cubit<ContactsListState> {
  ContactsListCubit() : super(InitContactsListState());

  void reload(ContactDao dao) async {
    emit(LoadingContactsListState());
    dao.findAll().then((contacts) => emit(LoadedContactsListState(contacts))).catchError(() => emit(FatalErrorContactsListState()));
  }
}