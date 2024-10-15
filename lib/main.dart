import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intelligent_security_systems/core/theme/app_theme.dart';
import 'package:intelligent_security_systems/feature/choose_mode/bloc/theme_cubit.dart';
import 'package:intelligent_security_systems/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';

import 'feature/auth/presentation/bloc/localization_cubit.dart';
import 'feature/splash/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LocalizationCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return BlocBuilder<LocalizationCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,
                title: 'Intelligent Security Systems',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: mode,
                debugShowCheckedModeBanner: false,
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
