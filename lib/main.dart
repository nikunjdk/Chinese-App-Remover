import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/logger.dart';
import 'app/router.gr.dart';

void main() {
  Logger.level = Level.info;
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final log = getLogger('MyApp');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chinese App Remover',
      initialRoute: Routes.homeViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
