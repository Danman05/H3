
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/future_screen.dart';
import 'package:flutter_application_1/screens/provider_screen.dart';
import 'package:flutter_application_1/screens/stream_screen.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// Local file imports
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/stateful_screen.dart';
import 'package:flutter_application_1/classes/counter_model.dart';
import 'package:flutter_application_1/screens/bloc_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
      ),
    );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'stateful',
          builder: (BuildContext context, GoRouterState state) {
            return const StatefulScreen();
          },
        ),
        GoRoute(
          path: 'provider',
          builder: (BuildContext context, GoRouterState state) {
            return const ProviderScreen();
          },
        ),
        GoRoute(
          path: 'bloc',
          builder: (BuildContext context, GoRouterState state ) {
            return const BlocScreen();
          },
        ),
        GoRoute(
          path: 'future',
          builder: (BuildContext context, GoRouterState state) {
            return const FutureScreen();
          },
        ),
        GoRoute(
          path: 'stream',
          builder: (BuildContext context, GoRouterState state) {
            return const StreamScreen();
          },
        ),
      ],
    ),
  ],
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}