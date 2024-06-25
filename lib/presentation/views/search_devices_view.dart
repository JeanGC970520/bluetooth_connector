import 'package:bluetooth_connector/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:bluetooth_connector/presentation/widgets/widgets.dart';

class SearchDevicesView extends StatelessWidget {
   
  const SearchDevicesView({super.key});
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Spacer(),

          Text(
            "Tap to start",
            style: TextStyle(
              color: AppTheme.kSeedColor,
              fontWeight: FontWeight.w500,
              fontSize: size.height * 0.032
            ),
          ),

          Text(
            "Search your device by signal sensor",
            style: TextStyle(
              color: AppTheme.kGray,
              fontSize: size.height * 0.018
            ),  
          ),

          const Spacer(),

          const BluetoothScanner(),

          const Spacer(),

          ElevatedButton(
            onPressed: () {
              
            }, 
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.015, horizontal: size.height * 0.02),
            ),
            child: Text(
              "Don't see device?",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.height * 0.018),
            ),
          ),

          const Spacer(flex: 3,),

        ],
      ),
    );
  }
}