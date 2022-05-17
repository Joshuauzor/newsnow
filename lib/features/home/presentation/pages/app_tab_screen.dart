import 'package:flutter/material.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/features/features.dart';

class AppTabView extends StatefulWidget {
  const AppTabView({Key? key}) : super(key: key);

  @override
  AppTabViewState createState() => AppTabViewState();
}

class AppTabViewState extends State<AppTabView> {
  int? _selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      _selectedIndex = 0;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _widgetOptions = <Widget?>[
      const HomeScreen(),
      const LatestNewsScreen(),
      Container(),
      Container(),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: _widgetOptions.elementAt(_selectedIndex!),
            ),
          ),
        ],
      ),
      bottomNavigationBar: FABBottomAppBar(
        backgroundColor: AppColors.white,
        selectedColor: AppColors.black,
        height: 50,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          FABBottomAppBarItem(
            icon: AppAsset.home,
          ),
          FABBottomAppBarItem(
            icon: AppAsset.trendingUp,
          ),
          FABBottomAppBarItem(
            icon: AppAsset.search,
          ),
          FABBottomAppBarItem(
            icon: AppAsset.bookmark,
          ),
        ],
      ),
    );
  }
}

class AppTabViewParams {
  AppTabViewParams({this.child, this.index});
  final int? index;
  final Widget? child;
}
