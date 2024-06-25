import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bluetooth_connector/config/router/routes.dart';
import 'package:bluetooth_connector/config/theme/app_theme.dart';
import 'package:bluetooth_connector/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
      
          const Spacer(flex: 2,),
      
          Stack(
            alignment: AlignmentDirectional.center,
            children: [

              
              const Circle(
                dotted: true,
                scale: 0.97,
                color: Colors.white,
              ),
      
              const Circle(
                dotted: true,
                scale: 0.80,
                color: Colors.white,
              ),
      
              Circle(
                scale: 0.63,
                color: AppTheme.kSeedColor.withAlpha(50),
              ),
      
              const Circle(
                scale: 0.45,
                color: Colors.white,
              ),
      
              DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.kSeedColor,
                      blurRadius: 15.0,
                    )
                  ] 
                ),
                child: Image.asset(
                  'assets/images/bluetooth.png',
                  scale: 2.0,
                ),
              ),

              BluetoothDeviceIcon(
                color: const Color(0xFF676FCF),
                position: const [
                  null, 50, 50, null,
                ],
                child: Image.asset(
                  'assets/images/mouse.png',
                  scale: 3.5,
                ),
              ),

              BluetoothDeviceIcon(
                color: const Color(0xFF66CE8C), 
                position: const [
                  40, 35, null, null,
                ],
                child: Image.asset(
                  'assets/images/airpods.png',
                  scale: 3.5,
                ), 
              ),

              BluetoothDeviceIcon(
                color: const Color(0xFFF2B538),
                position: const [
                  null, null, 50, 50,
                ],
                child: Image.asset(
                  'assets/images/keyboard.png',
                  scale: 3.5,
                ),
              ),

              BluetoothDeviceIcon(
                color: const Color(0xFFF57A37), 
                position: const [
                  65, null, null, 65,
                ],
                child: Image.asset(
                  'assets/images/mobile.png',
                  scale: 3.5,
                ), 
              ),
      
            ],
          ),
      
          const Spacer(),
      
          const _Body(),
      
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
            onPressed: () => context.go(Routes.search.path),
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