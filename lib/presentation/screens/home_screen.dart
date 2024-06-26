import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:bluetooth_connector/logger.dart';
import 'package:bluetooth_connector/config/router/routes.dart';
import 'package:bluetooth_connector/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Column(
        children: [
      
          Spacer(flex: 2,),
      
          BluetoothScanner(),
      
          Spacer(),
      
          _Body(),
      
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Column(
        children: [

          Text(
            'Bluetooth device connection application',
            style: TextStyle(
              color: Colors.black87,
              fontSize: size.height * 0.03,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
      
          const SizedBox(height: 10,),
      
          Text(
            'Locale yout Bluetooth devices nearby and avoid connect and interact with it',
            style: TextStyle(
              color: Colors.black38,
              fontSize: size.height * 0.016,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
      
          const SizedBox(height: 20,),
      
          ElevatedButton(
            onPressed: () async {

              if ( await FlutterBluePlus.isSupported == false ) {
                logger.w("OH!! Bluetooth not supperted by this device");
                return;
              }

              Map<Permission, PermissionStatus> statuses = await [
                Permission.bluetooth,
                Permission.location,
                Permission.notification,
              ].request();

              statuses.forEach((permission, status) {
                logger.d("Perm: $permission => status: $status");
                if(status.isDenied) return;
              },);
              
              Future.delayed(const Duration())
                .then((value) => context.go(Routes.search.path),);
            
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, size.height * 0.06)
            ), 
            child: Text(
              'Get Started', 
              style: TextStyle(fontSize: size.height * 0.02),
            ),       
          ),
        ],
      ),
    );
  }
}