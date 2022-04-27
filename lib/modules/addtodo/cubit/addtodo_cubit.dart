import 'package:bloc/bloc.dart';
import 'package:bloctodos/data/services/remote_services.dart';
import 'package:meta/meta.dart';

part 'addtodo_state.dart';

class AddtodoCubit extends Cubit<AddtodoState> {
  AddtodoCubit() : super(AddtodoInitial());
  Future<void> addnewtodo(String s) async {
    emit(Addtodloasding());
    if (s.isEmpty) {
      emit(AddtodoInitial());
      return;
    }
    try {
      print('nanesh');
      var mytodo = await RemoteServices.addtodo(s);
      emit(Addtodosuccess());
    } on Exception catch (e) {}
  }
}
