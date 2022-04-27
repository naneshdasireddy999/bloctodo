part of 'edittodo_cubit.dart';

@immutable
abstract class EdittodoState {}

class EdittodoInitialstate extends EdittodoState {}

class Edittodosuccessstate extends EdittodoState {}

class Edittodoerrorstate extends EdittodoState {}

class Edittodoloadingstate extends EdittodoState {}
