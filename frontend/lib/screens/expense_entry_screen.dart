import 'package:flutter/material.dart';

class ExpenseEntryScreen extends StatelessWidget {
  const ExpenseEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lançar Despesa'), backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text('Fotografar Recibo (Ler com IA)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.tealAccent,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                // Aqui vai a chamada para ImagePicker().pickImage(source: ImageSource.camera)
                // E o envio para /api/upload-receipt
              },
            ),
            const SizedBox(height: 30),
            const Text('Ou insira manualmente:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Descrição',
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              hint: const Text('Selecione a Conta / Cartão'),
              items: const [
                DropdownMenuItem(value: '1', child: Text('Conta Corrente')),
                DropdownMenuItem(value: '2', child: Text('Cartão Nubank')),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Salvar Despesa'),
            )
          ],
        ),
      ),
    );
  }
}
