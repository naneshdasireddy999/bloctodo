part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class Todoloaded extends TodoState {}

class Todoerror extends TodoState {}
