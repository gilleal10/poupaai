import 'package:flutter/material.dart';
import 'package:poupaai/main.dart'; // To navigate to MainScreen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentStep = 0;
  String _cardRule = 'compra';
  final TextEditingController _economyController = TextEditingController();

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    } else {
      // Save onboarding and navigate to home
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Configuração Inicial'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentStep + 1) / 3,
              backgroundColor: Colors.grey[800],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.tealAccent),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: _buildStepContent(),
            ),
            ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_currentStep == 2 ? 'Finalizar e Começar' : 'Avançar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    if (_currentStep == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Qual é a sua meta de economia mensal?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 16),
          const Text('Defina um valor alvo para economizar todo mês e alcançar seus sonhos.', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 32),
          TextField(
            controller: _economyController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 32, color: Colors.tealAccent, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              prefixText: 'R\$ ',
              prefixStyle: TextStyle(fontSize: 32, color: Colors.tealAccent),
              border: InputBorder.none,
              hintText: '0,00',
              hintStyle: TextStyle(color: Colors.white30),
            ),
          ),
        ],
      );
    } else if (_currentStep == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Como quer ver as despesas do cartão?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 32),
          _buildRadioOption('Pela data da compra', 'Contabiliza no dia em que foi realizada.', 'compra'),
          const SizedBox(height: 16),
          _buildRadioOption('Pela data da fatura', 'Contabiliza na data do vencimento.', 'fatura'),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Vamos criar seu primeiro Objetivo?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 16),
          const Text('Economizar é muito mais fácil quando se tem um alvo. Você pode configurar isso na aba "Sonhos".', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 32),
          Center(
            child: Icon(Icons.rocket_launch, size: 100, color: Colors.tealAccent.withOpacity(0.5)),
          ),
          const SizedBox(height: 32),
          const Text('Tudo pronto! Seu ecossistema POUPAAI foi personalizado.', textAlign: TextAlign.center, style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold)),
        ],
      );
    }
  }

  Widget _buildRadioOption(String title, String subtitle, String value) {
    bool isSelected = _cardRule == value;
    return GestureDetector(
      onTap: () => setState(() => _cardRule = value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.tealAccent.withOpacity(0.1) : const Color(0xFF1E1E1E),
          border: Border.all(color: isSelected ? Colors.tealAccent : Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off, color: isSelected ? Colors.tealAccent : Colors.grey),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 13)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
