import 'package:flutter/material.dart';
import 'package:penuba/home/home_route.dart';
import 'package:penuba/trip/trip_route.dart';

abstract class AppRoute {
  static final initial = TripRoute.all;

  static final _routes = {
    ...HomeRoute.routes,
    ...TripRoute.routes
  };

  static RouteFactory onGenerate = (settings) {
    final routeFactory = _routes[settings.name];

    if (routeFactory == null) {
      return null;
    }

    return routeFactory(settings);
  };
}
