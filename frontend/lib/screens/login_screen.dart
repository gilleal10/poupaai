import 'package:flutter/material.dart';
import 'package:poupaai/screens/onboarding_screen.dart';
import '../main.dart'; // To access MainScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF121212); // POUPAAI Dark background
    const Color cardColor = Color(0xFF121212); // Flat with background
    const Color inputColor = Color(0xFF1E1E1E); // POUPAAI Darker inputs
    const Color primaryColor = Colors.tealAccent; // POUPAAI Teal
    
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.account_balance_wallet, color: Colors.black, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('POUPAAI', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1)),
                        Text('Autonomia Econômica via IA', style: TextStyle(fontSize: 14, color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                
                // Form Fields
                const Text('E-MAIL', style: TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'seu@email.com',
                    hintStyle: const TextStyle(color: Colors.white30),
                    filled: true,
                    fillColor: inputColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                const SizedBox(height: 20),
                
                const Text('SENHA', style: TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: const TextStyle(color: Colors.white30),
                    filled: true,
                    fillColor: inputColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                const SizedBox(height: 30),
                
                // Login Button
                ElevatedButton.icon(
                  onPressed: _login,
                  icon: const Icon(Icons.login, color: Colors.black),
                  label: const Text('ENTRAR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                ),
                const SizedBox(height: 20),
                
                // Forgot Password
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Esqueci minha senha', style: TextStyle(color: Colors.white54, fontSize: 14)),
                  ),
                ),
                const SizedBox(height: 10),
                
                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Novo por aqui?', style: TextStyle(color: Colors.white30, fontSize: 14)),
                    ),
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Subscription Card
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor.withOpacity(0.3), width: 1.5),
                      borderRadius: BorderRadius.circular(16),
                      color: primaryColor.withOpacity(0.05),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Criar meu acesso', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Assine e comece agora', style: TextStyle(color: Colors.white54, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('R\$ 39,90', style: TextStyle(color: Colors.white30, fontSize: 12, decoration: TextDecoration.lineThrough)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text('R\$ 19,90', style: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
                                    Text(' /mês', style: TextStyle(color: Colors.white30, fontSize: 11)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, color: primaryColor, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Footer
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.lock, color: Colors.white30, size: 14),
                        SizedBox(width: 6),
                        Text('Pagamento seguro · Cancele quando quiser', style: TextStyle(color: Colors.white30, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text('Cartão · PIX · Boleto', style: TextStyle(color: Colors.white30, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
