import 'package:flutter/material.dart';

class ImportDataScreen extends StatelessWidget {
  const ImportDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Importar dados', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.help_outline, color: Colors.grey), onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Tipo', style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: const Text('Movimentações'),
                backgroundColor: Colors.tealAccent.withOpacity(0.2),
                labelStyle: const TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold),
                side: BorderSide.none,
              ),
            ),
            const SizedBox(height: 32),
            _buildImportCard(
              context,
              'Importar OFX',
              'Importe suas movimentações bancárias e faturas do cartão de crédito via arquivo OFX disponibilizado pelo seu banco.',
            ),
            const SizedBox(height: 16),
            _buildImportCard(
              context,
              'Importar CSV',
              'Insira seus dados de forma ainda mais rápida através da importação de planilhas CSV.',
            ),
            const SizedBox(height: 16),
            _buildImportCard(
              context,
              'Importar XLS',
              'Insira seus dados de forma ainda mais rápida através da importação de planilhas Excel.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImportCard(BuildContext context, String title, String description) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Simulando upload e leitura no Backend...'),
            backgroundColor: Color(0xFF1E1E1E),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: const Text('\$', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Text(description, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5)),
          ],
        ),
      ),
    );
  }
}
