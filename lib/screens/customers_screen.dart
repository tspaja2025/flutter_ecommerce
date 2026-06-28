import 'package:flutter_ecommerce/shared/dashboard_layout.dart';
import 'package:flutter_ecommerce/widgets/bar_chart_sample2.dart';
import 'package:flutter_ecommerce/widgets/pie_chart_sample.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Customers {
  final String id;
  final String name;
  final String email;
  final double total;
  final double orders;
  final String lastPurchase;

  const Customers({
    required this.id,
    required this.name,
    required this.email,
    required this.total,
    required this.orders,
    required this.lastPurchase,
  });

  String get formattedTotal => '\$${total.toStringAsFixed(2)}';
  String get formattedOrders => orders.toStringAsFixed(2);
}

class CustomersData {
  static const customer = [
    Customers(
      id: "1",
      name: 'Jane Doe',
      email: 'jane.doe@company.com',
      total: 12450.00,
      orders: 45.0,
      lastPurchase: '2 hours ago',
    ),
    Customers(
      id: "2",
      name: 'Marcus Smith',
      email: 'marcus.smith@company.com',
      total: 8210.50,
      orders: 21.0,
      lastPurchase: 'Yesterday',
    ),
    Customers(
      id: "3",
      name: 'Elena Lopez',
      email: 'elena.lopez@company.com',
      total: 3150.00,
      orders: 9.0,
      lastPurchase: 'Jan 12, 2026',
    ),
    Customers(
      id: "4",
      name: 'Tom Wilson',
      email: 'tom.wilson@company.com',
      total: 450.25,
      orders: 2.0,
      lastPurchase: 'Dec 20, 2025',
    ),
  ];
}

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  int page = 1;

  final Map<String, double> acquisitionData = {
    'Organic': 40,
    'Paid': 30,
    'Referral': 15,
    'Social': 15,
  };

  final List<double> retentionData = [75, 80, 78, 85, 82, 88];

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(title: 'Customers', child: _buildContent());
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Customer Insights').large.bold,
            const Text(
              'Manage and analyze your global customer base and lifetime value.',
            ).muted,
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
                            for (final customer in CustomersData.customer)
                              TableRow(
                                cells: [
                                  buildCell(customer.name),
                                  buildCell(customer.email),
                                  buildCell(customer.formattedTotal),
                                  buildCell(customer.formattedOrders),
                                  buildCell(customer.lastPurchase),
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
                        PieChartSample(data: acquisitionData),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Retention Rate"),
                        const SizedBox(height: 8),
                        BarChartSample2(data: retentionData),
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
