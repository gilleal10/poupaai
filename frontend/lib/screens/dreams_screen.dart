import 'package:flutter/material.dart';

class DreamsScreen extends StatelessWidget {
  const DreamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metas e Sonhos'), backgroundColor: Colors.transparent, elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDreamCard('Viagem para Europa', 15000.0, 3500.0, Colors.blueAccent, Icons.flight_takeoff),
          const SizedBox(height: 16),
          _buildDreamCard('Reserva de Emergência', 10000.0, 8000.0, Colors.tealAccent, Icons.security),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildDreamCard(String name, double target, double current, Color color, IconData icon) {
    double progress = current / target;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 12),
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('R\$ ${current.toStringAsFixed(2)}', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
              Text('R\$ ${target.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white54)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 8),
          Text('${(progress * 100).toInt()}% concluído', style: const TextStyle(color: Colors.white30, fontSize: 12)),
        ],
      ),
    );
  }
}
