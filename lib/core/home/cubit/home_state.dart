import 'package:food_application/data/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class Homeloading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Userdata> userlist;

  HomeSuccess({required this.userlist}); // Require userlist to be provided.
}

class HomeError extends HomeState {
  final String errormsg;

  HomeError({required this.errormsg});
}
