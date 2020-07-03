// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chineseappremover/ui/views/home/home_view.dart';
import 'package:chineseappremover/ui/views/show_all_apps/show_all_apps_view.dart';
import 'package:chineseappremover/ui/views/alternatives/alternatives_view.dart';

abstract class Routes {
  static const homeViewRoute = '/';
  static const showAllAppsViewRoute = '/show-all-apps-view-route';
  static const alternativesViewRoute = '/alternatives-view-route';
  static const all = {
    homeViewRoute,
    showAllAppsViewRoute,
    alternativesViewRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.showAllAppsViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ShowAllAppsView(),
          settings: settings,
        );
      case Routes.alternativesViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AlternativesView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
