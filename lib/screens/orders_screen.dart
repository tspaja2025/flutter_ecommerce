import 'package:flutter_ecommerce/shared/dashboard_layout.dart';
import 'package:flutter_ecommerce/widgets/badge.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Orders {
  final String id;
  final String date;
  final String customer;
  final PaymentStatus paymentStatus;
  final Fulfillment fulfillment;
  final double total;
  final Color paymentColor;
  final Color fulfillmentColor;

  const Orders({
    required this.id,
    required this.date,
    required this.customer,
    required this.paymentStatus,
    required this.fulfillment,
    required this.total,
    required this.paymentColor,
    required this.fulfillmentColor,
  });
}

enum PaymentStatus { failed, refunded, paid }

enum Fulfillment { unfulfilled, processing, shipped }

class OrdersData {
  static const orders = [
    Orders(
      id: "1",
      date: 'June 16, 2026, 08:39 AM',
      customer: 'Sarah Jenkins',
      paymentStatus: PaymentStatus.paid,
      fulfillment: Fulfillment.shipped,
      total: 249.00,
      paymentColor: Colors.green,
      fulfillmentColor: Colors.blue,
    ),
    Orders(
      id: "2",
      date: 'June 16, 2026, 08:39 AM',
      customer: 'Michael Thorne',
      paymentStatus: PaymentStatus.failed,
      fulfillment: Fulfillment.unfulfilled,
      total: 1420.50,
      paymentColor: Colors.red,
      fulfillmentColor: Colors.red,
    ),
    Orders(
      id: "3",
      date: 'June 16, 2026, 08:39 AM',
      customer: 'Eleanor vance',
      paymentStatus: PaymentStatus.paid,
      fulfillment: Fulfillment.processing,
      total: 56.25,
      paymentColor: Colors.green,
      fulfillmentColor: Colors.orange,
    ),
    Orders(
      id: "4",
      date: 'June 16, 2026, 08:39 AM',
      customer: 'Jameson Cook',
      paymentStatus: PaymentStatus.refunded,
      fulfillment: Fulfillment.shipped,
      total: 312.00,
      paymentColor: Colors.gray,
      fulfillmentColor: Colors.blue,
    ),
    Orders(
      id: "5",
      date: 'June 16, 2026, 08:39 AM',
      customer: 'Linda Wu',
      paymentStatus: PaymentStatus.paid,
      fulfillment: Fulfillment.shipped,
      total: 890.99,
      paymentColor: Colors.green,
      fulfillmentColor: Colors.blue,
    ),
  ];
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int index = 0;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(title: 'Orders', child: _buildContent());
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Orders Overview').large.bold,
                const Text(
                  'Manage and track your customer orders in real-time.',
                ).muted,
              ],
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () {},
              leading: const Icon(Icons.add),
              child: const Text('Create Order'),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabList(
              index: index,
              onChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: const [
                TabItem(child: Text('All Orders')),
                TabItem(child: Text('Pending')),
                TabItem(child: Text('Unfulfilled')),
                TabItem(child: Text('Completed')),
              ],
            ),
            const SizedBox(height: 16),
            IndexedStack(
              index: index,
              children: [
                Card(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Table(
                        columnWidths: {
                          0: FixedTableSize(110),
                          1: FixedTableSize(200),
                          2: FixedTableSize(150),
                          3: FixedTableSize(150),
                        },
                        rows: [
                          // Header
                          TableRow(
                            cells: [
                              buildHeaderCell('Order ID'),
                              buildHeaderCell('Date'),
                              buildHeaderCell('Customer Name'),
                              buildHeaderCell('Payment Status'),
                              buildHeaderCell('Fulfillment'),
                              buildHeaderCell('Total'),
                              buildHeaderCell('Action', true),
                            ],
                          ),
                          // Body
                          for (final order in OrdersData.orders)
                            TableRow(
                              cells: [
                                buildCell(order.id),
                                buildCell(order.date),
                                buildCell(order.customer),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    child: Badge(
                                      label: order.paymentStatus.name,
                                      color: order.paymentColor,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    child: Badge(
                                      label: order.fulfillment.name,
                                      color: order.fulfillmentColor,
                                    ),
                                  ),
                                ),
                                buildCell('\$${order.total}'),
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
