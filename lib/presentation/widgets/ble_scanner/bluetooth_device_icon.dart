import 'package:flutter/material.dart';

class BluetoothDeviceIcon extends StatelessWidget {
  const BluetoothDeviceIcon({
    super.key,
    required this.color,
    required this.child,
    this.x = 0,
    this.y = 0,
    this.onTap,
    this.connected = false,
  });

  final Color color;
  final Widget child;
  final double x;
  final double y;
  final VoidCallback? onTap;
  final bool connected;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: y >= 0 ? y : null,
      right: x >= 0 ? x : null,
      bottom: y < 0 ? -1 * y : null,
      left: x < 0 ? -1 * x : null,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color,
                    blurRadius: 7.5
                  )
                ]
              ),
              child: child,
            ),

            Visibility(
              visible: connected,
              child: Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/rounded_conn.png',
                  scale: 2.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}