import 'package:fl_chart/fl_chart.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Order {
  final String id;
  final String customer;
  final String date;
  final double amount;
  final OrderStatus status;
  final Color statusColor;

  const Order({
    required this.id,
    required this.customer,
    required this.date,
    required this.amount,
    required this.status,
    required this.statusColor,
  });
}

enum OrderStatus { success, pending, shipped }

class DashboardData {
  static const orders = [
    Order(
      id: '#ORD-2026-001',
      customer: 'John Doe',
      date: 'June 15, 2026',
      amount: 450.00,
      status: OrderStatus.success,
      statusColor: Colors.green,
    ),
    Order(
      id: '#ORD-2026-002',
      customer: 'Alice Smith',
      date: 'June 15, 2026',
      amount: 120.00,
      status: OrderStatus.pending,
      statusColor: Colors.orange,
    ),
    Order(
      id: '#ORD-2026-003',
      customer: 'Robert Wilson',
      date: 'June 15, 2026',
      amount: 89.00,
      status: OrderStatus.shipped,
      statusColor: Colors.blue,
    ),
  ];
}

class DashboardHomeScreen extends StatefulWidget {
  const DashboardHomeScreen({super.key});

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Expanded(
                child: MetricCard(
                  title: 'Total Revenue',
                  value: '\$128,430.00',
                  chart: BarChartSample(),
                ),
              ),
              Expanded(
                child: MetricCard(
                  title: 'Total Orders',
                  value: '1,842',
                  chart: BarChartSample(),
                ),
              ),
              Expanded(
                child: MetricCard(
                  title: 'Conversion Rate',
                  value: '3.24%',
                  chart: BarChartSample(),
                ),
              ),
              Expanded(
                child: MetricCard(
                  title: 'Active Customers',
                  value: '8,940',
                  chart: BarChartSample(),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Expanded(
                flex: 2,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Sales Overview'),
                              const Text(
                                'Revenue vs Orders for the last 30 days',
                              ).small.muted,
                            ],
                          ),
                          const Spacer(),
                          OutlineButton(
                            onPressed: () {},
                            child: const Text('Daily'),
                          ),
                          const SizedBox(width: 4),
                          OutlineButton(
                            onPressed: () {},
                            child: const Text('Weekly'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      LineChartSample(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Top Products'),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text('View All'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        url: 'https://placehold.co/48x48.png',
                        title: 'Nova Chronograph',
                        subtitle: '412 sales',
                        trailing: Text('\$199.00'),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        url: 'https://placehold.co/48x48.png',
                        title: 'Apex Audio H1',
                        subtitle: '385 sales',
                        trailing: Text('\$249.50'),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        url: 'https://placehold.co/48x48.png',
                        title: 'Legacy Messenger',
                        subtitle: '294 sales',
                        trailing: Text('\$150.0'),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        url: 'https://placehold.co/48x48.png',
                        title: 'Swift Runner Pro',
                        subtitle: '256 sales',
                        trailing: Text('\$120.00'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Recent Orders'),
                          const Spacer(),
                          OutlineButton(
                            onPressed: () {},
                            child: const Text('Export CSV'),
                          ),
                          const SizedBox(width: 8),
                          PrimaryButton(
                            onPressed: () {},
                            child: const Text('View Orders'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Table(
                        rows: [
                          // Header
                          TableRow(
                            cells: [
                              buildHeaderCell('Order ID'),
                              buildHeaderCell('Customer'),
                              buildHeaderCell('Date'),
                              buildHeaderCell('Amount'),
                              buildHeaderCell('Status'),
                              buildHeaderCell('Action', true),
                            ],
                          ),
                          // Body
                          for (final order in DashboardData.orders)
                            TableRow(
                              cells: [
                                buildCell(order.id),
                                buildCell(order.customer),
                                buildCell(order.date),
                                buildCell('\$${order.amount}'),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    child: Badge(
                                      label: order.status.name,
                                      color: order.statusColor,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.centerRight,
                                    child: IconButton.ghost(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_vert),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget chart;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 8),
          Text(value).large.bold,
          const SizedBox(height: 8),
          chart,
        ],
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final String label;
  final Color color;
  final bool outlined;

  const Badge({
    super.key,
    required this.label,
    required this.color,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: outlined ? null : color.withValues(alpha: 0.8),
        border: outlined ? Border.all(color: color) : null,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text(
        label,
        style: TextStyle(
          color: outlined ? color : Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ListTile extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final Widget trailing;

  const ListTile({
    super.key,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: NetworkImage(url)),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title).bold, Text(subtitle).muted.small],
        ),
        const Spacer(),
        trailing,
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
