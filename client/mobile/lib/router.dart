import 'package:flutter/material.dart';
import 'package:penuba/home/router.dart';
import 'package:penuba/trip/router.dart';

abstract class AppRouter {
  static final initialRoute = TripRouter.tripList;

  static final _routes = {
    ...HomeRouter.routes,
    ...TripRouter.routes
  };

  static RouteFactory onGenerateRoute = (settings) {
    final routeFactory = _routes[settings.name];

    if (routeFactory == null) {
      return null;
    }

    return routeFactory(settings);
  };
}
