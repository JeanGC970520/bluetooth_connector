


import 'package:bluetooth_connector/config/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: Routes.home.path,
  routes: [
    GoRoute(
      name: Routes.home.name,
      path: Routes.home.path,
      builder: (context, state) {
        return const Placeholder();
      },
    ),
  ]
);