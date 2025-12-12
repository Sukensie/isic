import 'package:flutter/material.dart';
import 'package:isic_app/screens/vice_screen.dart';
import 'widgets/bottom_nav_item.dart';
import 'screens/dashboard_screen.dart';
import 'screens/vouchery_screen.dart';
import 'screens/slevy_screen.dart';
import 'screens/show_card_screen.dart';

// --- MOCK DATA ---
final List<Map<String, dynamic>> newsItems = [
  {"title": "-20% on all individual therapy sessions", "subtitle": "Therapy that gets students 🧠", "description": "Feeling anxious, burned out, or just overwhelmed...", "imageColor": const Color(0xFFE91E63)},
  {"title": "Adobe Express Premium plan FREE for 2 months!", "subtitle": "Creative freedom 🚀", "description": "Grab the deal and make your student life easier and more creative!", "imageColor": const Color(0xFF9C27B0)},
  {"title": "50% off on all books", "subtitle": "Read more, spend less 📚", "description": "Exclusive discounts for all university students on textbooks and novels.", "imageColor": const Color(0xFF00BCD4)},
];

final List<Map<String, dynamic>> offerItems = [
  {"title": "Black Weeks - up to", "brand": "SAMSUNG", "imageColor": const Color(0xFF9E9E9E), "isPercentage": false},
  {"title": "10% off at Organic Basic", "brand": "Organic Basic", "imageColor": const Color(0xFF4CAF50), "isPercentage": true},
  {"title": "Free Pro account trial", "brand": "Spotify", "imageColor": const Color(0xFF2196F3), "isPercentage": false},
];

void main() {
  runApp(const StudentDashboardApp());
}

class StudentDashboardApp extends StatefulWidget {
  const StudentDashboardApp({super.key});

  @override
  State<StudentDashboardApp> createState() => _StudentDashboardAppState();
}

class _StudentDashboardAppState extends State<StudentDashboardApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(newsItems: newsItems, offerItems: offerItems),
    SlevyScreen(),
    // Placeholder for Zobrazit kartu (will trigger navigation)
    Container(),
    VoucheryScreen(),
    ViceScreen(),
  ];

  void _onNavTap(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ShowCardScreen()),
      );
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Dashboard',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E88E5),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.zero, // Ensure no internal padding
            child: SafeArea(
              top: false,
              bottom: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: const Color(0xFFB0B0B0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottomNavItem(
                          iconPath: '../assets/home.svg',
                          label: 'Domů',
                          isSelected: _selectedIndex == 0,
                          onTap: () => _onNavTap(0),
                        ),
                        BottomNavItem(
                          iconPath: '../assets/discounts.svg',
                          label: 'Slevy',
                          isSelected: _selectedIndex == 1,
                          onTap: () => _onNavTap(1),
                        ),
                        BottomNavItem(
                          iconPath: '../assets/isic_logo.svg',
                          label: 'Zobrazit kartu',
                          useIsicBadge: true,
                          isSelected: _selectedIndex == 2,
                          iconSize: 50,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ShowCardScreen()),
                            );
                          },
                        ),
                        BottomNavItem(
                          iconPath: '../assets/voucher.svg',
                          label: 'Vouchery',
                          isSelected: _selectedIndex == 3,
                          iconSize: 16,
                          onTap: () => _onNavTap(3),
                        ),
                        BottomNavItem(
                          iconPath: '../assets/more.svg',
                          label: 'Více',
                          iconSize: 8,
                          isSelected: _selectedIndex == 4,
                          onTap: () => _onNavTap(4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}