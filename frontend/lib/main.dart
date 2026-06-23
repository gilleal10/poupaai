import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/dream_manager_screen.dart';
import 'screens/debt_panel_screen.dart';
import 'screens/ai_chat_screen.dart';

void main() {
  runApp(const PoupaaiApp());
}

class PoupaaiApp extends StatelessWidget {
  const PoupaaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POUPAAI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.tealAccent,
        scaffoldBackgroundColor: const Color(0xFF121212),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const DashboardScreen(),
    const DreamManagerScreen(),
    const DebtPanelScreen(),
    const AIChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Sonhos'),
          BottomNavigationBarItem(icon: Icon(Icons.money_off), label: 'Dívidas'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Mentor IA'),
        ],
      ),
    );
  }
}
