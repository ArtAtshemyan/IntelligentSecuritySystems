import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LocalizationCubit extends HydratedCubit<Locale> {
  LocalizationCubit() : super(const Locale('en'));

  void updateLocale(Locale locale) => emit(locale);

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    final languageCode = json['languageCode'] as String?;
    if (languageCode != null) {
      return Locale(languageCode);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {'languageCode': state.languageCode};
  }
}
