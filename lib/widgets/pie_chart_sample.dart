import 'package:fl_chart/fl_chart.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class PieChartSample extends StatelessWidget {
  final Map<String, double> data;

  const PieChartSample({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Theme.of(context).colorScheme.primary,
      Colors.green,
      Colors.orange,
      Colors.red,
    ];

    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(show: false),
          sectionsSpace: 2,
          centerSpaceRadius: 40,
          sections: data.entries.toList().asMap().entries.map((entry) {
            final index = entry.key;
            final entryData = entry.value;
            return PieChartSectionData(
              color: colors[index % colors.length],
              value: entryData.value,
              title: '${entryData.value.toInt()}%',
              radius: 50,
              titleStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
