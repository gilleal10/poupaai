import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visão Geral', style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row of Top Cards
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard('Total Gasto', 'R\$ 3.450', Colors.white, isLarge: true),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildInfoCard('Média Diária', 'R\$ 138', Colors.tealAccent),
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Pie Chart Section
            const Text('Distribuição de Gastos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 4,
                      centerSpaceRadius: 60,
                      sections: [
                        PieChartSectionData(value: 1200, color: const Color(0xFF00C853), title: '34%', radius: 40, titleStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        PieChartSectionData(value: 800, color: const Color(0xFF0066CC), title: '23%', radius: 40, titleStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        PieChartSectionData(value: 950, color: const Color(0xFF8A05BE), title: '28%', radius: 40, titleStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        PieChartSectionData(value: 500, color: const Color(0xFFFF7A00), title: '15%', radius: 40, titleStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Alimentação', style: TextStyle(color: Color(0xFF00C853), fontWeight: FontWeight.bold)),
                      Text('Maior Gasto', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 10,
              children: [
                _buildLegendItem(const Color(0xFF00C853), 'Alimentação'),
                _buildLegendItem(const Color(0xFF0066CC), 'Transporte'),
                _buildLegendItem(const Color(0xFF8A05BE), 'Lazer'),
                _buildLegendItem(const Color(0xFFFF7A00), 'Contas'),
              ],
            ),
            const SizedBox(height: 30),
            
            // Bottom Bar Chart Section
            const Text('Mês Atual x Próximo Mês', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 6000,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
                          String text = value.toInt() == 0 ? 'Mês Atual' : 'Próximo Mês';
                          return SideTitleWidget(axisSide: meta.axisSide, child: Text(text, style: style));
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 3450, color: Colors.tealAccent, width: 22, borderRadius: BorderRadius.circular(4))]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 3200, color: Colors.orangeAccent, width: 22, borderRadius: BorderRadius.circular(4))]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, Color valueColor, {bool isLarge = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: valueColor, fontSize: isLarge ? 28 : 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}
