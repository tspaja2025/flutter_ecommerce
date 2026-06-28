import 'package:fl_chart/fl_chart.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class LineChartSample extends StatefulWidget {
  const LineChartSample({super.key});

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 30,
          minY: 0,
          maxY: 100,

          gridData: FlGridData(show: false),

          borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(color: Colors.gray.shade300),
              bottom: BorderSide(color: Colors.gray.shade300),
            ),
          ),

          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('01 May');
                    case 10:
                      return const Text('10 May');
                    case 20:
                      return const Text('20 May');
                    case 30:
                      return const Text('30 May');
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),

          lineBarsData: [
            // Revenue
            LineChartBarData(
              isStrokeCapRound: true,
              isCurved: true,
              curveSmoothness: 0.35,
              barWidth: 3,
              color: Colors.indigo,
              spots: const [
                FlSpot(0, 18),
                FlSpot(4, 24),
                FlSpot(8, 20),
                FlSpot(12, 38),
                FlSpot(16, 66),
                FlSpot(20, 62),
                FlSpot(25, 50),
                FlSpot(28, 58),
                FlSpot(30, 78),
              ],

              dotData: FlDotData(show: false),

              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.indigo.withOpacity(.25), Colors.transparent],
                ),
              ),
            ),

            // Orders
            LineChartBarData(
              isCurved: true,
              barWidth: 2,
              color: Colors.teal,
              dashArray: [4, 4],
              spots: const [
                FlSpot(0, 8),
                FlSpot(4, 11),
                FlSpot(8, 10),
                FlSpot(12, 24),
                FlSpot(16, 42),
                FlSpot(20, 24),
                FlSpot(24, 18),
                FlSpot(28, 24),
                FlSpot(30, 30),
              ],
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
