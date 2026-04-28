import 'package:flutter/material.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/zikr/zikr_screen.dart';
import '../../presentation/screens/sebha/sebha_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String zikr = '/zikr';
  static const String sebha = '/sebha';
  static const String settings = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case zikr:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ZikrScreen(
            categoryTitle: args['title'] as String,
            categoryId: args['id'] as int,
          ),
        );
      case AppRouter.sebha:
        return MaterialPageRoute(builder: (_) => const SebhaScreen());
      case AppRouter.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
