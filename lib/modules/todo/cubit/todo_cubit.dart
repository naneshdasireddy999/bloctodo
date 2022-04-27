import 'package:bloc/bloc.dart';
import 'package:bloctodos/data/models/todo_model.dart';
import 'package:bloctodos/data/services/remote_services.dart';
import 'package:bloctodos/modules/todo/views/widgets/todo_error.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  List<Todo> lt = [];
  Future<void> fetchtodos() async {
    var mytodo = await RemoteServices.fetchtodo();
    if (mytodo != null) {
      lt = mytodo;
      emit(Todoloaded());
    } else {
      emit(Todoerror());
    }
  }

  Future<void> changecompletion(int id, Todo t) async {
    var mytodo = await RemoteServices.patchtodo(id, t);
    fetchtodos();
  }
}
