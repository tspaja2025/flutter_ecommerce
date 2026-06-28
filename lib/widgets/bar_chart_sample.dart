import 'package:fl_chart/fl_chart.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class BarChartSample extends StatefulWidget {
  const BarChartSample({super.key});

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  List<BarChartGroupData> get barGroups =>
      [2, 4, 6, 8, 10, 12, 14].asMap().entries.map((entry) {
        int i = entry.key;
        int value = entry.value;
        return BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: value.toDouble(),
              color: Colors.black,
              width: 20,
              borderRadius: BorderRadius.circular(0),
            ),
          ],
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: BarChart(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOutQuad,
        BarChartData(
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: barGroups,
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceAround,
          maxY: 15,
        ),
      ),
    );
  }
}
