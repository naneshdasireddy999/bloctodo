import 'package:flutter/material.dart';

class todoloading extends StatelessWidget {
  const todoloading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
