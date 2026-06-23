import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/expense_entry_screen.dart';
import 'screens/credit_cards_screen.dart';
import 'screens/ai_chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dreams_screen.dart';

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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.tealAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
        ),
      ),
      home: const LoginScreen(),
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
    const ExpenseEntryScreen(),
    const CreditCardsScreen(),
    const DreamsScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Resumo'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Lançar'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cartões'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Sonhos'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Mentor IA'),
        ],
      ),
    );
  }
}
