
import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';

import 'package:bluetooth_connector/config/router/routes.dart';
import 'package:bluetooth_connector/presentation/views/views.dart';
import 'package:bluetooth_connector/presentation/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home.path,
  routes: [
    
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: Routes.home.name,
      path: Routes.home.path,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),

    ShellRoute(
      parentNavigatorKey: _rootNavigatorKey,
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        final String title = state.fullPath == Routes.search.path ? 'Search device' : 'Chat';
        return DashboardScreen(
          title: title,
          child: child,
        );
      },
      routes: [

        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: Routes.search.path,
          name: Routes.search.name,
          builder: (context, state) {
            return const SearchDevicesView();
          },          
        ),

        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: Routes.chat.path,
          name: Routes.chat.name,
          builder: (context, state) {
            return const ChatView();
          },
        ), 

      ],
    ),

  ]
);