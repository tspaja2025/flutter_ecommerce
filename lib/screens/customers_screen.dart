import 'package:fl_chart/fl_chart.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Customer Insights'),
            const Text(
              'Manage and analyze your global customer base and lifetime value.',
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextField(
                            placeholder: const Text('Search...'),
                            features: [
                              InputFeature.leading(
                                StatedWidget.builder(
                                  builder: (context, states) {
                                    if (states.hovered) {
                                      return const Icon(Icons.search);
                                    } else {
                                      return const Icon(
                                        Icons.search,
                                      ).iconMutedForeground();
                                    }
                                  },
                                ),
                                visibility: InputFeatureVisibility.textEmpty,
                              ),
                              InputFeature.clear(
                                visibility:
                                    (InputFeatureVisibility.textNotEmpty &
                                        InputFeatureVisibility.focused) |
                                    InputFeatureVisibility.hovered,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Table(
                          rows: [
                            // Header
                            TableRow(
                              cells: [
                                buildHeaderCell('Customer'),
                                buildHeaderCell('Email'),
                                buildHeaderCell('Total Spent'),
                                buildHeaderCell('Orders'),
                                buildHeaderCell('Last Purchase', true),
                              ],
                            ),
                            // Body
                            TableRow(
                              cells: [
                                buildCell('Jane Doe'),
                                buildCell('jane.doe@example.com'),
                                buildCell('\$12,450.00'),
                                buildCell('45'),
                                buildCell('2 hours ago'),
                              ],
                            ),
                            TableRow(
                              cells: [
                                buildCell('Marcus Smith'),
                                buildCell('marcus.smith@example.com'),
                                buildCell('\$8,210.50'),
                                buildCell('21'),
                                buildCell('Yesterday'),
                              ],
                            ),
                            TableRow(
                              cells: [
                                buildCell('Elena Lopez'),
                                buildCell('elena.lopez@example.com'),
                                buildCell('\$3,150.00'),
                                buildCell('9'),
                                buildCell('Jan 12, 2026'),
                              ],
                            ),
                            TableRow(
                              cells: [
                                buildCell('Tom Wilson'),
                                buildCell('tom.wilson@example.com'),
                                buildCell('\$450.25'),
                                buildCell('2'),
                                buildCell('Dex 20, 2025'),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Pagination(
                                showLabel: false,
                                page: page,
                                totalPages: 12,
                                onPageChanged: (value) {
                                  setState(() {
                                    page = value;
                                  });
                                },
                                maxPages: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Customer Acquisition"),
                        const SizedBox(height: 8),
                        PieChartSample(),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Retention Rate"),
                        const SizedBox(height: 8),
                        BarChartSample(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  TableCell buildHeaderCell(String text, [bool alignRight = false]) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: alignRight ? Alignment.centerRight : null,
        child: Text(text).muted.semiBold,
      ),
    );
  }

  TableCell buildCell(String text, [bool alignRight = false]) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: alignRight ? Alignment.centerRight : null,
        child: Text(text),
      ),
    );
  }
}

class PieChartSample extends StatefulWidget {
  const PieChartSample({super.key});

  @override
  State<PieChartSample> createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(height: 18),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(color: Colors.blue, text: 'First', isSquare: true),
              SizedBox(height: 4),
              Indicator(color: Colors.orange, text: 'Second', isSquare: true),
              SizedBox(height: 4),
              Indicator(color: Colors.purple, text: 'Third', isSquare: true),
              SizedBox(height: 4),
              Indicator(color: Colors.green, text: 'Fourth', isSquare: true),
              SizedBox(height: 18),
            ],
          ),
          const SizedBox(width: 28),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return switch (i) {
        0 => PieChartSectionData(
          color: Colors.blue,
          value: 40,
          title: '40%',
          radius: 50.0,
          titleStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            shadows: shadows,
          ),
        ),
        1 => PieChartSectionData(
          color: Colors.orange,
          value: 30,
          title: '30%',
          radius: 50.0,
          titleStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            shadows: shadows,
          ),
        ),
        2 => PieChartSectionData(
          color: Colors.purple,
          value: 15,
          title: '15%',
          radius: 50.0,
          titleStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            shadows: shadows,
          ),
        ),
        3 => PieChartSectionData(
          color: Colors.green,
          value: 15,
          title: '15%',
          radius: 50.0,
          titleStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            shadows: shadows,
          ),
        ),
        _ => throw StateError('Invalid'),
      };
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

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
