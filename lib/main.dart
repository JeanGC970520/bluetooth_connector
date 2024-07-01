import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bluetooth_connector/config/theme/app_theme.dart';
import 'package:bluetooth_connector/config/router/app_router.dart';
import 'package:bluetooth_connector/presentation/blocs/bluetooth/bluetooth_bloc.dart';
import 'package:bluetooth_connector/infrastructure/datasource/blue_plus_datasource.dart';
import 'package:bluetooth_connector/infrastructure/repositories/blue_repository_impl.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => BlueRepositoryImpl(BluePlusDatasource()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BluetoothBloc(context.read<BlueRepositoryImpl>()),
      child: MaterialApp.router(
        title: 'Bluetooth connector',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
