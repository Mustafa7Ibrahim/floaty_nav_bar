import 'package:floaty_nav_bar/floaty_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floaty Nav Bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  late List<FloatyTab> floatyTabs;
  int selectedTab = 0;

  List<Widget> get tabs {
    return [
      const Center(child: Text('Home')),
      const Center(child: Text('Search')),
      const Center(child: Text('Profile')),
      const Center(child: Text('Settings')),
    ];
  }

  void changeTab(int index) {
    _pageController.jumpToPage(index);
    setState(() => selectedTab = index);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: const SquircleShape().shapeBorder,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: const Text('Floaty Nav Bar')),
      body: PageView(
        controller: _pageController,
        children: tabs,
        onPageChanged: (index) => setState(() => selectedTab = index),
      ),
      bottomNavigationBar: FloatyNavBar(
        selectedTab: selectedTab,
        tabs: [
          FloatyTab(
            isSelected: selectedTab == 0,
            onTap: () => changeTab(0),
            title: 'Home',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome01,
              color: selectedTab == 0 ? Colors.white : Colors.black,
            ),
            floatyActionButton: FloatyActionButton(
              icon: const Icon(Icons.add),
              onTap: () => showSnackBar('Add button tapped'),
            ),
          ),
          FloatyTab(
            isSelected: selectedTab == 1,
            onTap: () => changeTab(1),
            title: 'Search',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              color: selectedTab == 1 ? Colors.white : Colors.black,
            ),
          ),
          FloatyTab(
            isSelected: selectedTab == 2,
            onTap: () => changeTab(2),
            title: 'Profile',
            selectedColor: Colors.green,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedPresentationOnline,
              color: selectedTab == 2 ? Colors.white : Colors.black,
            ),
            floatyActionButton: FloatyActionButton(
              icon: const Icon(Icons.edit),
              onTap: () => showSnackBar('Edit button tapped'),
              backgroundColor: Colors.green,
            ),
          ),
          FloatyTab(
            isSelected: selectedTab == 3,
            onTap: () => changeTab(3),
            title: 'Watt',
            icon: SvgPicture.asset(
              'assets/wat.svg',
              width: 24,
              height: 24,
              colorFilter: selectedTab == 3
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
