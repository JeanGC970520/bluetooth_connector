
import 'package:flutter/material.dart';

Future<Object?> generalDialog(
  BuildContext context, 
  {
    required String title,
    required ValueChanged onClosed,
    List<Widget> children = const [],
    bool extendBody = false,
    bool dismissible = true,
    AxisDirection direction = AxisDirection.down,
    CrossAxisAlignment align = CrossAxisAlignment.center,
  }
) {

    final double offset = extendBody ? 16 : 48;
    final Size size = MediaQuery.of(context).size;
    final double height = extendBody ? size.height * 0.8 : size.height * 0.4;

    return showGeneralDialog(
      context: context,
      barrierLabel: title,
      barrierDismissible: dismissible,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        final Offset offset = setOffset(direction);
        tween = Tween(begin: offset, end: Offset.zero);
        return SlideTransition(
          position: tween.animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      }, 
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: extendBody 
            ? null 
            : const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: extendBody ? Colors.transparent : Colors.white.withOpacity(0.94),
            borderRadius: const BorderRadius.all(Radius.circular(40))
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: align,
                    children: [
                      if( !extendBody ) 
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 34, 
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ...children,
                    ],
                  ),
                ),
                if( dismissible )
                  Positioned(
                    left: (size.width / 2) - 56,
                    top: height - offset,
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.black,),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ).then(onClosed);
  }

  Offset  setOffset(AxisDirection dir ) {
    switch (dir) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.right:
        return const Offset(1, 0);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.left:
        return const Offset(-1, 0);
    }
  }