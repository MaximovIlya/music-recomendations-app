abstract class ChooseMoodEvent {}

class LoadChooseMood extends ChooseMoodEvent{
  final String mood;
  final String favorites;
  final String nature;

  LoadChooseMood(this.mood, this.favorites, this.nature);
}