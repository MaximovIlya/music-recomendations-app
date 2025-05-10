abstract class ChooseMoodEvent {}

class LoadChooseMood extends ChooseMoodEvent{
  final String message;

  LoadChooseMood(this.message);
}