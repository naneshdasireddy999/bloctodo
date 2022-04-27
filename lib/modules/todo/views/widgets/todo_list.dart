import 'package:bloctodos/modules/todo/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todolist extends StatelessWidget {
  const Todolist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TodoCubit>();
    return ListView.builder(
        itemCount: cubit.lt.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/edittodo', arguments: index);
            },
            child: Dismissible(
                confirmDismiss: (_) async {
                  cubit.changecompletion(cubit.lt[index].id, cubit.lt[index]);
                  return false;
                },
                background: Container(
                  color: Colors.indigo,
                ),
                key: Key(cubit.lt[index].id.toString()),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cubit.lt[index].todo),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              width: 4,
                              color: cubit.lt[index].isCompleted
                                  ? Colors.green
                                  : Colors.red),
                        ),
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                )),
          );
        });
  }
}
