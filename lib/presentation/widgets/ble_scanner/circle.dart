import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';

import '../../../config/theme/app_theme.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.scale,
    required this.color,
    this.dotted = false,
  });

  final double scale;
  final Color color;
  final bool dotted;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    if(dotted) {
      return DottedBorder(
        color: AppTheme.kSeedColor.withAlpha(100),
        strokeWidth: 2.0,
        dashPattern: const [18, 10],
        borderType: BorderType.Circle,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1000 * scale),
          ),
          width: size.width * scale,
          height: size.width * scale,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1000 * scale),
      ),
      width: size.width * scale,
      height: size.width * scale,
    );
  }
}