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
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
      ),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      screens: screens,
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
