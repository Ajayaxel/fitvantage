import 'package:flutter_bloc/flutter_bloc.dart';
import 'lifestyle_event.dart';
import 'lifestyle_state.dart';
import '../../repositories/lifestyle_repository.dart';

class LifestyleBloc extends Bloc<LifestyleEvent, LifestyleState> {
  final LifestyleRepository repository;

  LifestyleBloc(this.repository) : super(LifestyleInitial()) {
    on<FetchLifestyleQuestions>((event, emit) async {
      emit(LifestyleLoading());
      try {
        final response = await repository.fetchLifestyleQuestions();
        emit(LifestyleLoaded(response.data));
      } catch (e) {
        emit(LifestyleError(e.toString()));
      }
    });
  }
}
