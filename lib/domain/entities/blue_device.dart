

import 'package:flutter/material.dart';
import 'package:bluetooth_connector/config/theme/app_theme.dart';

class BlueDevice {

  final String name;
  final String id;
  final String? rssi;
  final int? deviceClass; // https://domoticx.com/bluetooth-class-of-device-lijst-cod/ https://stackoverflow.com/questions/29513987/determine-type-of-connected-bluetooth-device-in-android https://stackoverflow.com/questions/70535290/bluetoothclass-of-devices-what-is-what

  BlueDevice({
    required this.name, 
    required this.id, 
    required this.rssi,
    required this.deviceClass,
  });

  (String?, Color) getImageAndColor() {
    switch (deviceClass) {
      case 0x0540: // Keyboard
        return ('assets/images/keyboard.png',AppTheme.kYellow);
      case 0x0580: // Mouse - 1408
        return ('assets/images/mouse.png',AppTheme.kPurple);
      case 0x0200: // Phone
        return ('assets/images/mobile.png',AppTheme.kOrange);
      case 0x0400: // Audio/video
        return ('assets/images/airpods.png',AppTheme.kGreen);
      default: // Other.
        return (null, AppTheme.kSeedColor);
    }
  }

  @override
  String toString() {
    return 'BlDev( $name - $id - $rssi - $deviceClass )';    
  }

}