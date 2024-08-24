import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle), 
      ),
      body: Center(
        child: _buildContent(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home, 
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: AppLocalizations.of(context)!.business, 
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: AppLocalizations.of(context)!.school, 
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return Text(AppLocalizations.of(context)!.homeContent); 
      case 1:
        return Text(AppLocalizations.of(context)!.businessContent); 
      case 2:
        return Text(AppLocalizations.of(context)!.schoolContent); 
      default:
        return Container();
    }
  }
}
