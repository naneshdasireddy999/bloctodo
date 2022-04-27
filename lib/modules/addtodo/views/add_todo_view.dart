import 'package:bloctodos/modules/addtodo/cubit/addtodo_cubit.dart';
import 'package:bloctodos/modules/addtodo/views/widgets/addtodo_error.dart';
import 'package:bloctodos/modules/addtodo/views/widgets/addtodo_loading.dart';
import 'package:bloctodos/modules/addtodo/views/widgets/addtodo_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Addtodoview extends StatelessWidget {
  const Addtodoview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddtodoCubit>();
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        if (state is Addtodosuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('AddtodoView'),
            centerTitle: true,
          ),
          body: cubit.state is Addtodloasding
              ? const addtodoloading()
              : cubit.state is Addtodoerror
                  ? const Addtodoerrors()
                  : addtodoview()),
    );
  }
}
