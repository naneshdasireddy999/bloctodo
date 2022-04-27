import 'package:bloctodos/modules/addtodo/cubit/addtodo_cubit.dart';
import 'package:bloctodos/modules/addtodo/views/add_todo_view.dart';
import 'package:bloctodos/modules/edittodo/cubit/edittodo_cubit.dart';
import 'package:bloctodos/modules/edittodo/views/edit_todo_view.dart';
import 'package:bloctodos/modules/todo/cubit/todo_cubit.dart';
import 'package:bloctodos/modules/todo/views/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Approutes {
  static final tc = TodoCubit();
  static final atc = AddtodoCubit();
  static final etc = EdittodoCubit();
  static Map<String, Widget Function(BuildContext)> myroutes() {
    return {
      '/': (context) => BlocProvider<TodoCubit>.value(
            value: tc,
            child: const Todoview(),
          ),
      '/addtodo': (context) => MultiBlocProvider(
            providers: [
              BlocProvider<TodoCubit>.value(
                value: tc,
              ),
              BlocProvider<AddtodoCubit>.value(
                value: atc,
              )
            ],
            child: const Addtodoview(),
          ),
      '/edittodo': (context) => MultiBlocProvider(
            providers: [
              BlocProvider<TodoCubit>.value(
                value: tc,
              ),
              BlocProvider<EdittodoCubit>.value(
                value: etc,
              )
            ],
            child: const Edittodoview(),
          ),
    };
  }
}
