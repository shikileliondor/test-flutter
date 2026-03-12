import 'package:flutter/material.dart';

import 'screens/main_navigation_screen.dart';
import 'screens/metiers_api_list_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String metiersApi = '/metiers-api';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (_) => const MainNavigationScreen(),
      metiersApi: (_) => const MetiersApiListScreen(),
    };
  }
}
