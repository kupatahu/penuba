import 'package:flutter/material.dart';
import 'package:penuba/widget/rounded_modal_route.dart';
import 'package:penuba/trip/trip_creation_page.dart';
import 'package:penuba/trip/trip_list_page.dart';

abstract class TripRoute {
  static String all = '/trips/all';
  static String create = '/trips/create';

  static Map<String, RouteFactory> routes = {
    all: (settings) => MaterialPageRoute(
          builder: (context) => const TripListPage(),
        ),
    create: (settings) => RoundedModalRoute(
          builder: (context) => TripCreationPage(
            scrollController: ScrollController(),
          ),
        ),
  };
}
