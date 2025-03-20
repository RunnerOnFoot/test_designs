import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeMode { blue, orange }

// Events
abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;
  ChangeThemeEvent(this.themeMode);
}

// State
class ThemeState {
  final ThemeMode themeMode;

  ThemeState(this.themeMode);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeMode.blue)) {
    on<ChangeThemeEvent>((event, emit) {
      emit(ThemeState(event.themeMode));
    });
  }
}
