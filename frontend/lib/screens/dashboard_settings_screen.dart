import 'package:flutter/material.dart';

class DashboardSettingsScreen extends StatefulWidget {
  const DashboardSettingsScreen({super.key});

  @override
  State<DashboardSettingsScreen> createState() => _DashboardSettingsScreenState();
}

class _DashboardSettingsScreenState extends State<DashboardSettingsScreen> {
  final Map<String, bool> _settings = {
    'Pendências e alertas': true,
    'Contas': true,
    'Cartões de crédito': true,
    'Despesas por categoria (Gráfico)': true,
    'Planejamento mensal': true,
    'Transações favoritas': false,
    'Balanço mensal': true,
    'Frequência de gastos': false,
    'Economia mensal': false,
    'Objetivos': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Gerenciar tela inicial'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, _settings); // Return preferences
            },
            child: const Text('Salvar', style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold, fontSize: 16)),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: _settings.keys.map((String key) {
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.drag_handle, color: Colors.grey),
                title: Text(key, style: const TextStyle(color: Colors.white, fontSize: 16)),
                trailing: Switch(
                  value: _settings[key]!,
                  activeColor: Colors.tealAccent,
                  onChanged: (bool value) {
                    setState(() {
                      _settings[key] = value;
                    });
                  },
                ),
              ),
              const Divider(color: Colors.white10),
            ],
          );
        }).toList(),
      ),
    );
  }
}
