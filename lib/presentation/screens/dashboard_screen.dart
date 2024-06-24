
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
      bottomNavigationBar: BottomNav(
        intialNavItem: 'Search',
        items: [
          BottomNavBaseItem(
            icon: CupertinoIcons.calendar,
            label: 'Calendar',
            onTap: () {  },
          ),
          
          BottomNavBaseItem(
            icon: CupertinoIcons.search,
            label: 'Search',
            onTap: () {  },
          ),

          BottomNavBaseItem(
            icon: CupertinoIcons.device_phone_portrait,
            label: 'Chat',
            onTap: () {  },
          ),
        ],
      ),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({
    super.key,
    required this.items,
    this.intialNavItem,
  });

  final List<BottomNavBaseItem> items;
  final String? intialNavItem;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  late String _labelSelected; 

  @override
  void initState() {
    super.initState();
    _labelSelected = widget.items.first.label;
    if( widget.intialNavItem != null ) {
      _labelSelected = widget.intialNavItem!;
    }
  }

  void updateSelectedItem(String label) {
    setState(() {
      _labelSelected = label;
    });
  }

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items
          .map((item) {
            return BottomNavItem(
              icon: item.icon,
              label: item.label,
              onTap: () {
                updateSelectedItem(item.label);
                if(item.onTap != null) item.onTap!();
              },
              isSelected: _labelSelected == item.label,
            );
          },).toList(),
      ),
    );
  }
}

class BottomNavBaseItem {

  final IconData icon;
  final String label;
  final Function()? onTap;

  BottomNavBaseItem({required this.icon, required this.label, required this.onTap});
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  final bool isSelected;
  final IconData icon;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ?AppTheme.kSeedColorAlp60 : null,
          borderRadius: BorderRadius.circular(50),
        ),
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
              ),
            ),
              
          ],
        ),
      ),
    );
  }
}