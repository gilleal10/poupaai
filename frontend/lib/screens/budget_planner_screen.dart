import 'package:flutter/material.dart';

class BudgetPlannerScreen extends StatelessWidget {
  const BudgetPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Categorias', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.tealAccent, width: 8),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Total categorizado', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  Text('R\$ 1.500,00', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('R\$ 2.500,00 sem categorização', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.tealAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_outline, color: Colors.tealAccent),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Para remover ou adicionar categorias ao seu planejamento, toque em "Gerenciar categorias"',
                    style: TextStyle(color: Colors.tealAccent, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Categorias', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildCategoryCard('Casa', Icons.home, Colors.blue, 800.0),
          _buildCategoryCard('Educação', Icons.menu_book, Colors.purple, 400.0),
          _buildCategoryCard('Lazer', Icons.beach_access, Colors.orange, 200.0),
          _buildCategoryCard('Saúde', Icons.medical_services, Colors.green, 100.0),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFF1E1E1E),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Total categorizado', style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text('R\$ 1.500,00', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text('R\$ 2.500,00 sem categorização', style: TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.grey[700],
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color, double total) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 24,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Total', style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text(
                'R\$ ${total.toStringAsFixed(2)}',
                style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
