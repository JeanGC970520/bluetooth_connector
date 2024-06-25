import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';
import '../../../config/theme/app_theme.dart';


class BluetoothScanner extends StatelessWidget {
  const BluetoothScanner({
    super.key,
  });

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
          glowColor: AppTheme.kSeedColorAlp60,
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
    
        BluetoothDeviceIcon(
          color: const Color(0xFF676FCF),
          position: const [
            null, 50, 50, null,
          ],
          child: Image.asset(
            'assets/images/mouse.png',
            scale: 3.5,
            color: AppTheme.kWhite,
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
            color: AppTheme.kWhite,
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
            color: AppTheme.kWhite,
          ), 
        ),
          
      ],
    );
  }
}