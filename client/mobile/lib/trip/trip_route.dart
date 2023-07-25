import 'package:flutter/material.dart';
import 'package:penuba/bottom_sheet_route/bottom_sheet_route.dart';
import 'package:penuba/trip/trip_creation_page.dart';
import 'package:penuba/trip/trip_list_page.dart';

abstract class TripRoute {
  static String tripList = '/trips';
  static String tripCreation = '/trips/create';

  static Map<String, RouteFactory> routes = {
    tripList: (settings) => MaterialPageRoute(
          builder: (context) => const TripListPage(),
        ),
    tripCreation: (settings) => BottomSheetRoute(
          builder: (context, scrollController) => TripCreationPage(
            scrollController: scrollController,
          ),
        ),
  };
}
