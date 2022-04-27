import 'package:bloc/bloc.dart';
import 'package:bloctodos/data/services/remote_services.dart';
import 'package:bloctodos/modules/todo/views/widgets/todo_error.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'edittodo_state.dart';

class EdittodoCubit extends Cubit<EdittodoState> {
  EdittodoCubit() : super(EdittodoInitialstate());
  final mycontroller = TextEditingController();
  Future<void> deletetodo(int id) async {
    emit(Edittodoloadingstate());
    try {
      var mytodo = await RemoteServices.deletetodo(id);
      emit(Edittodosuccessstate());
    } on Exception catch (e) {
      emit(Edittodoerrorstate());
    }
  }

  Future<void> ledittodo(int id, String s) async {
    emit(Edittodoloadingstate());
    try {
      var mytodo = await RemoteServices.edittodo(id, s);
      emit(Edittodosuccessstate());
    } on Exception catch (e) {
      emit(Edittodoerrorstate());
    }
  }
}
