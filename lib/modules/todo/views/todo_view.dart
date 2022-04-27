import 'package:bloctodos/modules/todo/cubit/todo_cubit.dart';
import 'package:bloctodos/modules/todo/views/widgets/todo_error.dart';
import 'package:bloctodos/modules/todo/views/widgets/todo_list.dart';
import 'package:bloctodos/modules/todo/views/widgets/todo_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todoview extends StatelessWidget {
  const Todoview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TodoCubit>();
    Future.delayed(const Duration(seconds: 1))
        .then((value) => cubit.fetchtodos());
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoView'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/addtodo');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: cubit.state is TodoInitial
          ? const todoloading()
          : cubit.state is Todoloaded
              ? const Todolist()
              : const todoerror(),
    );
  }
}
