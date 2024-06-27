import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:avatar_glow/avatar_glow.dart';

import '../widgets.dart';
import '../../../config/theme/app_theme.dart';
import '../../../domain/entities/blue_device.dart';


class BluetoothScanner extends StatelessWidget {
  const BluetoothScanner({
    super.key,
    this.animate = false,
    this.onTap,
    this.devices,
  });

  final bool animate;
  final Function()? onTap;
  final List<BlueDevice>? devices;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          
        AvatarGlow(
          glowCount: 3,
          animate: animate,
          glowColor: AppTheme.kSeedColorAlp60,
          child: InkWell(
            onTap: onTap,
            child: DecoratedBox(
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
          ),
        ),

        if(devices != null )
          ...devices!.map((device) {
              final (image, color) =  device.getImageAndColor();
              final degreesPerDevice = 360 / (devices!.length);  // Number of divisions
              final theta = degreesPerDevice * devices!.indexOf(device); // Grados
              final radians = (theta * pi) / 180;
              final x = -50 * cos(radians);
              final y = -50 * sin(radians);
              return BluetoothDeviceIcon(
                x: x,
                y: y,
                color: color,
                child: image == null 
                ? Icon(
                    CupertinoIcons.bluetooth, 
                    color: AppTheme.kWhite,
                    size: MediaQuery.of(context).size.height * 0.035,
                  )
                : Image.asset(
                    'assets/images/mouse.png',
                    scale: 3.5,
                    color: AppTheme.kWhite,
                  ),
              );
            },
          ),

        if(devices == null)
          ...fakeDevices(),

      ],
    );
  }

  List<Widget> fakeDevices() {
    return [
      BluetoothDeviceIcon(
        color: AppTheme.kPurple,
        x: 50,
        y: -50,
        child: Image.asset(
          'assets/images/mouse.png',
          scale: 3.5,
          color: AppTheme.kWhite,
        ),
      ),

      BluetoothDeviceIcon(
        color: AppTheme.kGreen, 
        x: 40,
        y: 50,
        child: Image.asset(
          'assets/images/airpods.png',
          scale: 3.5,
        ), 
      ),
  
      BluetoothDeviceIcon(
        color: AppTheme.kYellow,
        x: -60,
        y: -30,
        child: Image.asset(
          'assets/images/keyboard.png',
          scale: 3.5,
          color: AppTheme.kWhite,
        ),
      ),
  
      BluetoothDeviceIcon(
        color: AppTheme.kOrange, 
        x: -60,
        y: 40,
        child: Image.asset(
          'assets/images/mobile.png',
          scale: 3.5,
          color: AppTheme.kWhite,
        ), 
      ),
    ]; 
  }
}