import 'package:flutter/material.dart';

class BluetoothDeviceIcon extends StatelessWidget {
  const BluetoothDeviceIcon({
    super.key,
    required this.color,
    required this.child,
    required this.position,
  });

  final Color color;
  final Widget child;
  final List<double?> position;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position[0],
      right: position[1],
      bottom: position[2],
      left: position[3],
      child: Container(
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
    );
  }
}