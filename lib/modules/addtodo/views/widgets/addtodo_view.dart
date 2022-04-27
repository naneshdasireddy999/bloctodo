import 'package:bloctodos/modules/addtodo/cubit/addtodo_cubit.dart';
import 'package:bloctodos/modules/todo/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addtodoview extends StatelessWidget {
  final controller = TextEditingController();
  addtodoview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c1 = context.watch<AddtodoCubit>();
    final c2 = context.watch<TodoCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'enter todo message'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () async {
                try {
                  c1.addnewtodo(controller.text);
                  c2.fetchtodos();
                } on Exception catch (e) {
                  return;
                }
              },
              child: const Text('add todo'))
        ],
      ),
    );
  }
}
