import 'package:flutter/material.dart';
import 'package:penuba/feature/home/router.dart';

abstract class AppRouter {
  static final initialRoute = HomeRouter.home;

  static final _routes = {
    ...HomeRouter.routes
  };

  static RouteFactory onGenerateRoute = (settings) {
    final routeFactory = _routes[settings.name];

    if (routeFactory == null) {
      return null;
    }

    return routeFactory(settings);
  };
}
