import 'package:flutter/material.dart';
import 'package:penuba/trip/trip_list_page.dart';

abstract class TripRouter {
  static String tripList = '/trips';

  static Map<String, RouteFactory> routes = {
    tripList: (settings) => MaterialPageRoute(
          builder: (context) => const TripListPage(),
        )
  };
}
