import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_recomendations/features/choose_mood/domain/entities/choose_mood_entity.dart';
import 'package:music_recomendations/features/choose_mood/domain/usecases/choose_mood_use_case.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_event.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_state.dart';

class ChooseMoodBloc extends Bloc<ChooseMoodEvent, ChooseMoodState> {
  final ChooseMoodUseCase chooseMoodUseCase;

  ChooseMoodBloc({required this.chooseMoodUseCase}) : super(ChooseMoodLoadingState()) {
    on<LoadChooseMood>(_onLoadChooseMood);
  }

  Future<void> _onLoadChooseMood(LoadChooseMood event, Emitter<ChooseMoodState> emit) async {
    emit(ChooseMoodLoadingState());
    try {
      final List<ChooseMoodEntity> songs = await chooseMoodUseCase(event.mood, event.favorites, event.nature);
      emit(ChooseMoodLoadedState(songs));
    } catch (e) {
      emit(ChooseMoodErrorState(e.toString()));
    }
  }
}
