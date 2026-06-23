import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseEntryScreen extends StatefulWidget {
  const ExpenseEntryScreen({super.key});

  @override
  State<ExpenseEntryScreen> createState() => _ExpenseEntryScreenState();
}

class _ExpenseEntryScreenState extends State<ExpenseEntryScreen> {
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  bool _clipboardChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkClipboardForPix();
    });
  }

  Future<void> _checkClipboardForPix() async {
    if (_clipboardChecked) return;
    _clipboardChecked = true;
    
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && data.text != null) {
      String text = data.text!;
      if (text.contains("R\$") || text.toLowerCase().contains("pix")) {
        RegExp regExp = RegExp(r"(\d+[\.,]\d{2})");
        var match = regExp.firstMatch(text);
        if (match != null) {
          String valueFound = match.group(0)!;
          
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Valor de R\$ $valueFound detectado copiado. Deseja registrar?'),
              action: SnackBarAction(
                label: 'SIM',
                textColor: Colors.tealAccent,
                onPressed: () {
                  setState(() {
                    _valorController.text = valueFound;
                    _descController.text = "Pix Automático";
                  });
                },
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: const Color(0xFF1E1E1E),
            ),
          );
        }
      }
    }
  }

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
              onPressed: () {},
            ),
            const SizedBox(height: 30),
            const Text('Ou insira manualmente:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            TextField(
              controller: _valorController,
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
              controller: _descController,
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
              hint: const Text('Categoria'),
              items: const [
                DropdownMenuItem(value: 'Alimentação', child: Text('Alimentação')),
                DropdownMenuItem(value: 'Transporte', child: Text('Transporte')),
                DropdownMenuItem(value: 'Lazer', child: Text('Lazer')),
                DropdownMenuItem(value: 'Contas', child: Text('Contas de Casa')),
              ],
              onChanged: (value) {},
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
