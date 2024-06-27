

import 'package:flutter/material.dart';
import 'package:bluetooth_connector/config/theme/app_theme.dart';

class BlueAppearance {

  static const Map<int, String> _type = {
    0    : 'Unknown',
    64   : 'Generic Phone',
    128  : 'Generic Computer',
    192  : 'Generic Watch',
    193  : 'Sports Watch',
    256  : 'Generic Clock',
    320  : 'Generic Display',
    384  : 'Generic Remote Control',
    448  : 'Generic Eye-glasses',
    512  : 'Generic Tag',
    576  : 'Generic Keyring',
    640  : 'Generic Media Player',
    704  : 'Generic Barcode Scanner',
    768  : 'Generic Headset',
    832  : 'Hands-Free',
    896  : 'Microphone',
    960  : 'Loudspeaker',
    1024 : 'Headphones',
    1088 : 'Portable Audio',
    1152 : 'Car Audio',
    1280 : 'Keyboard',
    1344 : 'Mouse',
    1408 : 'Joystick',
    1472 : 'Gamepad',
    1536 : 'Digitizer Tablet',
    1600 : 'Card Reader',
    1664 : 'Pulse Oximeter',
    1728 : 'Thermometer',
    1792 : 'Weighing Scale',
    1856 : 'Glucose Meter',
    1920 : 'Health Data Display',
    1984 : 'Display',
    2048 : 'Scanner',
    2112 : 'Printer',
    2176 : 'Camera',
    2240 : 'Wristwatch',
    2304 : 'Pager',
    2368 : 'Jacket',
    2432 : 'Helmet',
    2496 : 'Glasses',
    3136 : 'Toy',
    3200 : 'Robot',
    3264 : 'Vehicle',
    3328 : 'Building',
    3392 : 'Kitchen Appliance',
  };

  final int _value;

  BlueAppearance(int value): _value=value;

  String? get value => _type.containsKey(_value) ? _type[_value] : _type[0];

}

class BlueDevice {

  final String name;
  final String id;
  final String? rssi;
  final int? deviceClass; // https://domoticx.com/bluetooth-class-of-device-lijst-cod/ https://stackoverflow.com/questions/29513987/determine-type-of-connected-bluetooth-device-in-android https://stackoverflow.com/questions/70535290/bluetoothclass-of-devices-what-is-what
  final bool connectable;
  final BlueAppearance? appearance;

  BlueDevice({
    required this.name, 
    required this.id, 
    required this.rssi,
    required this.deviceClass,
    required this.connectable,
    required this.appearance,
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
      case 0xFE03: // Audio/video
        return ('assets/images/airpods.png',AppTheme.kGreen);
      case 0xFD82: // Audio/video
        return ('assets/images/airpods.png',AppTheme.kGreen);
      default: // Other.
        return (null, AppTheme.kSeedColor);
    }
  }

  @override
  String toString() {
    return 'BlDev( $name - $id - $rssi - $deviceClass - $connectable - ${appearance?.value} )';    
  }

}