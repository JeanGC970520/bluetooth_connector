
import 'package:bluetooth_connector/config/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Search Device', style: TextStyle(fontWeight: FontWeight.w500),),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.settings_outlined, size: size.height * 0.035, color: Colors.grey,),
          )
        ],
      ),
      body: const Placeholder(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(size.width * 0.05),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <BottomNavItem>[

          BottomNavItem(
            icon: CupertinoIcons.calendar,
            label: 'Calendar',
            isSelected: false,
          ),
          
          BottomNavItem(
            icon: CupertinoIcons.search,
            label: 'Search',
            isSelected: true,
          ),

          BottomNavItem(
            icon: CupertinoIcons.device_phone_portrait,
            label: 'Chat',
            isSelected: false,
          ),

        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  final bool isSelected;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(10),
      decoration: isSelected 
      ? BoxDecoration(
          color: AppTheme.kSeedColorAlp60,
          borderRadius: BorderRadius.circular(50),
        )
      : null,
      child: Row(
        children: [
          Icon(
            icon,
            size: size.height * 0.03, 
            color: isSelected ? AppTheme.kSeedColorBold : Colors.grey,
          ),
          Visibility(
            visible: isSelected,
            child: Row(
              children: [
                const SizedBox(width: 5,),
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle( fontSize: size.height * 0.02, color: AppTheme.kSeedColorBold, ),
                ),
              ],
            )
          ),
            
        ],
      ),
    );
  }
}