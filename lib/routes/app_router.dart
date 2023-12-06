import 'package:flutter/material.dart';
import 'package:tictactoe/routes/app_routes.dart';
import 'package:tictactoe/views/game.dart';
import 'package:tictactoe/views/splash_screen.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.game:
        return _materialRoute(const Game());

      default:
        return _materialRoute(const SplashScreen());
    }
  }

  // ignore: unused_element
  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
