part of 'addtodo_cubit.dart';

@immutable
abstract class AddtodoState {}

class AddtodoInitial extends AddtodoState {}

class Addtodosuccess extends AddtodoState {}

class Addtodoerror extends AddtodoState {}

class Addtodloasding extends AddtodoState {}
