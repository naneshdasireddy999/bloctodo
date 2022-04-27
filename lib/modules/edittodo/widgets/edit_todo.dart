import 'package:bloctodos/modules/edittodo/cubit/edittodo_cubit.dart';
import 'package:bloctodos/modules/edittodo/widgets/edittodo_loading.dart';
import 'package:bloctodos/modules/todo/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Editttodo extends StatefulWidget {
  final int index;
  final String s;

  Editttodo({Key? key, required this.index, required this.s}) : super(key: key);

  @override
  State<Editttodo> createState() => _EditttodoState();
}

class _EditttodoState extends State<Editttodo> {
  @override
  void initState() {
    controller.text = widget.s;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final mykey = GlobalKey<FormState>();

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<EdittodoCubit>();
    final cubit2 = context.watch<TodoCubit>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'enter todo message'),
            autocorrect: true,
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                cubit.ledittodo(cubit2.lt[widget.index].id, controller.text);
                cubit2.fetchtodos();
              },
              child: const Text('edit todo'))
        ],
      ),
    );
  }
}
