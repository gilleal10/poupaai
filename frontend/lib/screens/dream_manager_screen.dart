import 'package:flutter/material.dart';

class DreamManagerScreen extends StatelessWidget {
  const DreamManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestor de Sonhos'), backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star_border, size: 80, color: Colors.tealAccent),
            const SizedBox(height: 20),
            const Text('Nenhum sonho cadastrado ainda.', style: TextStyle(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent, foregroundColor: Colors.black),
              child: const Text('Adicionar Sonho'),
            )
          ],
        ),
      ),
    );
  }
}
