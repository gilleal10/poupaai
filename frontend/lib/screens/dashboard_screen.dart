import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Diagnóstico Automático (IA)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.tealAccent)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(12)),
              child: const Text('Suas dívidas estão consumindo 40% da sua renda. O ideal é reduzir para menos de 30%.\nStatus: Atenção', style: TextStyle(color: Colors.white70)),
            ),
            const SizedBox(height: 20),
            const Text('Plano Estratégico 90 Dias', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.tealAccent)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.check_circle_outline, color: Colors.tealAccent), title: Text('Mês 1: Renegociar cartão de crédito'), subtitle: Text('Meta: Poupar R\$ 500,00')),
                  ListTile(leading: Icon(Icons.circle_outlined, color: Colors.grey), title: Text('Mês 2: Cortar assinaturas não utilizadas'), subtitle: Text('Meta: Poupar R\$ 150,00')),
                  ListTile(leading: Icon(Icons.circle_outlined, color: Colors.grey), title: Text('Mês 3: Iniciar reserva de emergência'), subtitle: Text('Meta: Poupar R\$ 300,00')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
