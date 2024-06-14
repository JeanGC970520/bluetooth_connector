
import 'package:flutter/material.dart';

import 'package:bluetooth_connector/config/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
        
            // Stack(
            //   children: [
        
            //     Container(
            //       decoration: BoxDecoration(
            //         color: AppTheme.kSeedColor.withAlpha(150),
            //         borderRadius: BorderRadius.circular(100),
            //       ),
            //       width: size.width * 0.3,
            //       height: size.height * 0.3,
            //     ),
        
            //     Image.asset(
            //       'assets/images/bluetooth.png',
            //     ),
        
            //   ],
            // ),

            const SizedBox(height: 20,),
        
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
              onPressed: () {},
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
      ),
    );
  }
}