import 'package:flutter_ecommerce/shared/dashboard_layout.dart';
import 'package:flutter_ecommerce/widgets/badge.dart';
import 'package:flutter_ecommerce/widgets/bar_chart_sample.dart';
import 'package:flutter_ecommerce/widgets/line_chart_sample.dart';
import 'package:flutter_ecommerce/widgets/list_tile.dart';
import 'package:flutter_ecommerce/widgets/metric_card.dart';
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

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(title: 'Dashboard', child: _buildContent());
  }

  Widget _buildContent() {
    return SingleChildScrollView(
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
