// import 'package:example/module/zakat/zakat_navbar_dashboard/controller/zakat_navbar_dashboard_controller.dart';
import 'package:example/core.dart';
import 'package:flutter/material.dart';

//bikin bottom navigation bar enggak usah pakai controller

class ZakatNavbarDashboardView extends StatefulWidget {
  const ZakatNavbarDashboardView({super.key});

  @override
  State<ZakatNavbarDashboardView> createState() =>
      _ZakatNavbarDashboardWidgetState();

  // build(BuildContext context,
  //     ZakatNavbarDashboardController zakatNavbarDashboardController) {}
}

class _ZakatNavbarDashboardWidgetState extends State<ZakatNavbarDashboardView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ZakatDashboardView(),
    Text(
      'Index 1: Laporan',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
