import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'app/app.dart';
import 'instance/instance.dart';

Future<void> main() async {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    return runApp(RootApplication(envConfig: EnvConfigFactory.prd));
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
