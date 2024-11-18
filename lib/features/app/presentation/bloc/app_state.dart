part of 'app_bloc.dart';

 class AppState extends Equatable {
  final String? currentLang;
  final List<Map<String,String>>? languages;

  @override
  List<Object?> get props => [currentLang,languages];

  const AppState({
    this.currentLang,
    this.languages,
  });


  AppState copyWith({
    String? currentLang,
    List<Map<String,String>>? languages,
  }){
    return AppState(
        currentLang: currentLang ?? this.currentLang,
        languages:  languages ?? this.languages,
      );
  }
}

final class AppInitial extends AppState {}

final class AppLanguagesError extends AppState {
  final String error;

  const AppLanguagesError(this.error);
}
