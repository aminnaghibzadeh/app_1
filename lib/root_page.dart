import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_note_page.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:flutter_application_1/report_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 3;

  List<Widget> pages = [
    const ProfilePage(),
    const AddNotePage(),
    const ReportPage(),
    const HomePage(),
  ];

  List<IconData> iconList = [
    Icons.person,
    Icons.add_task,
    Icons.bar_chart,
    Icons.home,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
        elevation: 0.0,
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNotePage(),
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        activeIndex: bottomIndex,
        icons: iconList,
        iconSize: 20,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
      ),
    );
  }
}
