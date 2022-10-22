

import 'package:Campus_Finder/View/all_universities_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Campus_Finder/utils/routes/routes_name.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.all_universities:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AllUniversities());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
