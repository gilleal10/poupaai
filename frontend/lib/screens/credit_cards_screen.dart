import 'package:flutter/material.dart';

class CreditCardsScreen extends StatelessWidget {
  const CreditCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Cartões'), backgroundColor: Colors.transparent, elevation: 0),
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
                  const Text('Cartão Nubank', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('Fatura Atual: R\$ 1.250,00', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.upload_file),
                        label: const Text('Importar PDF'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.withOpacity(0.2), foregroundColor: Colors.tealAccent),
                        onPressed: () {
                          // Chamada para FilePicker e envio para /api/upload-invoice
                        },
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.camera),
                        label: const Text('Nova Compra'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent, foregroundColor: Colors.black),
                        onPressed: () {
                           // Abre a câmera e lança direto nesse cartão
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
