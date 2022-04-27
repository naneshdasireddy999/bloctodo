import 'package:bloctodos/modules/edittodo/cubit/edittodo_cubit.dart';
import 'package:bloctodos/modules/edittodo/widgets/edit_todo.dart';

import 'package:bloctodos/modules/todo/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Edittodoview extends StatelessWidget {
  const Edittodoview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<EdittodoCubit>();
    final cubit2 = context.watch<TodoCubit>();
    final index = ModalRoute.of(context)?.settings.arguments as int;
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        if (state is Edittodosuccessstate) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: () async {
                  await cubit.deletetodo(cubit2.lt[index].id);
                  cubit2.fetchtodos();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.delete),
                ),
              )
            ],
            title: const Text('EdittodoView'),
            centerTitle: true,
          ),
          body: Editttodo(index: index, s: cubit2.lt[index].todo)),
    );
  }
}
