import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:quotes/features/splash/presentation/screens/splash_screen.dart';
import 'package:quotes/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<RandomQuoteCubit>(),
            child: const QuoteScreen(),
          ),
        );
      default:
        return underfinedRoute();
    }
  }

  static Route<dynamic> underfinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(
                AppStrings.noRouteFound,
              ),
            ),
          )),
    );
  }
}
