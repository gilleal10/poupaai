import 'package:flutter/material.dart';

class DebtPanelScreen extends StatelessWidget {
  const DebtPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Painel de Dívidas'), backgroundColor: Colors.transparent, elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: const Color(0xFF1E1E1E),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Cartão de Crédito', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('Saldo: R\$ 5.000,00', style: TextStyle(fontSize: 16)),
                  const Text('CET: 12.5% a.m.', style: TextStyle(fontSize: 16, color: Colors.redAccent)),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const Text('Comparativo com Mercado (Bacen):', style: TextStyle(fontSize: 14, color: Colors.tealAccent)),
                  const Text('SELIC: 0.85% a.m.', style: TextStyle(fontSize: 14)),
                  const Text('CDI: 0.84% a.m.', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent, foregroundColor: Colors.black),
                    child: const Text('Simular Renegociação via IA'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
