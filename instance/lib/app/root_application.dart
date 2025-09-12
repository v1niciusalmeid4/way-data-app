import 'package:core/app_way_data_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:instance/instance/instance.dart';
import 'package:instance/app/app.dart';

class RootApplication extends StatefulWidget {
  final EnvConfig envConfig;

  const RootApplication({required this.envConfig, super.key});

  @override
  State<RootApplication> createState() => _RootApplicationState();
}

class _RootApplicationState extends State<RootApplication>
    with WidgetsBindingObserver {
  EnvConfig get env => widget.envConfig;
  late bool isInitialized;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    isInitialized = false;
    InstanceInjector(envConfig: env).dependencies();

    for (var element in screens) {
      element.injector?.dependencies();
    }

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationMaterialApp(
      title: 'Way Data',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        cardTheme: CardThemeData(
          elevation: 0.3,
          color: lightColorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        tabBarTheme: TabBarThemeData(
          labelColor: lightColorScheme.secondary,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.grey.shade400,
          dividerHeight: 2.5,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: lightColorScheme.secondaryContainer,
          labelStyle: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(color: lightColorScheme.secondary),
          shape: const StadiumBorder(side: BorderSide(style: BorderStyle.none)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        textTheme: TextTheme(
          labelSmall: TextStyle(color: lightColorScheme.secondary),
          labelMedium: TextStyle(color: lightColorScheme.secondary),
          labelLarge: TextStyle(color: lightColorScheme.secondary),
          titleSmall: TextStyle(color: lightColorScheme.secondary),
          titleMedium: TextStyle(color: lightColorScheme.secondary),
          titleLarge: TextStyle(color: lightColorScheme.secondary),
        ),
        focusColor: Theme.of(context).colorScheme.secondary,
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
        expansionTileTheme: ExpansionTileThemeData(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          collapsedBackgroundColor: Theme.of(context).colorScheme.onSecondary,
          collapsedShape: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 0.5,
          ),
          shape: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 0.5,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: darkColorScheme.tertiary,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 1.0,
          color: darkColorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.white,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.white.withAlpha(100),
          dividerHeight: 2.5,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: darkColorScheme.primaryContainer,
          labelStyle: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(color: darkColorScheme.primary),
          shape: const StadiumBorder(side: BorderSide(style: BorderStyle.none)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      screens: screens,
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
