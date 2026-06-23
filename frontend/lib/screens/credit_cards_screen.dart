import 'package:flutter/material.dart';

class CreditCardsScreen extends StatefulWidget {
  const CreditCardsScreen({super.key});

  @override
  State<CreditCardsScreen> createState() => _CreditCardsScreenState();
}

class _CreditCardsScreenState extends State<CreditCardsScreen> {
  // Mock list of cards
  final List<Map<String, dynamic>> _cards = [
    {
      'banco': 'Nubank',
      'limite': 5000.0,
      'fatura_atual': 1250.0,
      'dia_fechamento': 25,
      'dia_vencimento': 2,
      'cor_hex': 0xFF8A05BE,
    }
  ];

  void _showAddCardModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => const AddCardForm(),
    ).then((newCard) {
      if (newCard != null) {
        setState(() {
          _cards.add(newCard);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Cartões'), backgroundColor: Colors.transparent, elevation: 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          final card = _cards[index];
          final color = Color(card['cor_hex'] as int);
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [color.withOpacity(0.8), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(card['banco'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      const Icon(Icons.credit_card, color: Colors.white70),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Fatura Atual: R\$ ${card['fatura_atual'].toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, color: Colors.white)),
                  const SizedBox(height: 5),
                  Text('Limite: R\$ ${card['limite'].toStringAsFixed(2)}', style: const TextStyle(fontSize: 14, color: Colors.white70)),
                  const SizedBox(height: 5),
                  Text('Vence dia ${card['dia_vencimento']} (Fecha dia ${card['dia_fechamento']})', style: const TextStyle(fontSize: 14, color: Colors.white70)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.upload_file, size: 16),
                        label: const Text('Importar PDF'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2), 
                          foregroundColor: Colors.white,
                          elevation: 0,
                        ),
                        onPressed: () {},
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.camera_alt, size: 16),
                        label: const Text('Comprar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, 
                          foregroundColor: color,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCardModal,
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}

class AddCardForm extends StatefulWidget {
  const AddCardForm({super.key});

  @override
  State<AddCardForm> createState() => _AddCardFormState();
}

class _AddCardFormState extends State<AddCardForm> {
  final _bancoCtrl = TextEditingController();
  final _limiteCtrl = TextEditingController();
  final _vencimentoCtrl = TextEditingController();
  final _fechamentoCtrl = TextEditingController();
  
  int _selectedColor = 0xFF8A05BE; // Default purple
  final List<int> _colors = [
    0xFF8A05BE, // Nubank Purple
    0xFFFF7A00, // Itau Orange
    0xFFCC0000, // Santander Red
    0xFF0066CC, // BB/Caixa Blue
    0xFF00C853, // Next Green
    0xFF121212, // Black
  ];

  void _save() {
    Navigator.pop(context, {
      'banco': _bancoCtrl.text,
      'limite': double.tryParse(_limiteCtrl.text) ?? 0.0,
      'fatura_atual': 0.0,
      'dia_vencimento': int.tryParse(_vencimentoCtrl.text) ?? 1,
      'dia_fechamento': int.tryParse(_fechamentoCtrl.text) ?? 1,
      'cor_hex': _selectedColor,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Cadastrar Novo Cartão', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          TextField(
            controller: _bancoCtrl, 
            decoration: InputDecoration(
              labelText: 'Nome do Banco/Cartão',
              filled: true,
              fillColor: const Color(0xFF121212),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            )
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _limiteCtrl, 
            keyboardType: TextInputType.number, 
            decoration: InputDecoration(
              labelText: 'Limite Total (R\$)',
              filled: true,
              fillColor: const Color(0xFF121212),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            )
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _vencimentoCtrl, 
                  keyboardType: TextInputType.number, 
                  decoration: InputDecoration(
                    labelText: 'Dia do Vencimento',
                    filled: true,
                    fillColor: const Color(0xFF121212),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  )
                )
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _fechamentoCtrl, 
                  keyboardType: TextInputType.number, 
                  decoration: InputDecoration(
                    labelText: 'Dia do Fechamento',
                    filled: true,
                    fillColor: const Color(0xFF121212),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  )
                )
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Cor do Cartão:', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _colors.map((color) {
              return GestureDetector(
                onTap: () => setState(() => _selectedColor = color),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(color),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _selectedColor == color ? Colors.white : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 16)),
            onPressed: _save,
            child: const Text('SALVAR CARTÃO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
