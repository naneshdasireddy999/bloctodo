import 'package:flutter/material.dart';

class addtodoloading extends StatelessWidget {
  const addtodoloading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
