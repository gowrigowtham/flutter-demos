import 'package:flutter/material.dart';

import '../provider/view/gallery_photos.dart';
import '../getx/view/gallery_upload.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> pages = [
    const GalleryPhotos(),
    const GalleryPhotos(),
    GalleryUpload()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: _showBottomNavigationBar(),
    );
  }

  Widget _showBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xffF5591F),
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }

  void _onTap(int value) {
    _selectedIndex = value;
    setState(() {
      print('selected value:{$_selectedIndex}');
    });
  }
}
