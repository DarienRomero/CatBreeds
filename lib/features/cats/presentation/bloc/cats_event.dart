part of 'cats_bloc.dart';
@immutable
abstract class CatsEvent {
  
}
class StartGetCats extends CatsEvent {
  StartGetCats();
}