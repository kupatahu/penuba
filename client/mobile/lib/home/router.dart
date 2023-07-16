import 'package:flutter/material.dart';
import 'package:penuba/home/home_page.dart';

abstract class HomeRouter {
  static String home = '/home';

  static Map<String, RouteFactory> routes = {
    home: (settings) => MaterialPageRoute(
          builder: (context) => const HomePage(),
        )
  };
}
