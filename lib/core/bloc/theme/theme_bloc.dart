import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeMode { blue, orange, dark }

// Events
abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;
  ChangeThemeEvent(this.themeMode);
}

// State
class ThemeState {
  final ThemeMode themeMode;
  ThemeState({required this.themeMode});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: ThemeMode.blue)) {
    on<ChangeThemeEvent>((event, emit) {
      emit(ThemeState(themeMode: event.themeMode));
    });
  }
}
