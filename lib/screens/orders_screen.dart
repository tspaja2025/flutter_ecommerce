import 'package:shadcn_flutter/shadcn_flutter.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Orders Overview'),
                const Text(
                  'Manage and track your customer orders in real-time.',
                ),
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
                          TableRow(
                            cells: [
                              buildCell('#ORD-0001'),
                              buildCell('Jun 16, 2026, 08:39 AM'),
                              buildCell('Sarah Jenkins'),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Paid",
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Shipped",
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              buildCell('\$249.00'),
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
                          TableRow(
                            cells: [
                              buildCell('#ORD-0002'),
                              buildCell('Jun 16, 2026, 08:39 AM'),
                              buildCell('Michael Thorne'),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Failed",
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Unfulfilled",
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              buildCell('\$1,420.50'),
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
                          TableRow(
                            cells: [
                              buildCell('#ORD-0003'),
                              buildCell('Jun 16, 2026, 08:39 AM'),
                              buildCell('Eleanor Vance'),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Paid",
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Processing",
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              buildCell('\$56.25'),
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
                          TableRow(
                            cells: [
                              buildCell('#ORD-0004'),
                              buildCell('Jun 16, 2026, 08:39 AM'),
                              buildCell('Jameson Cook'),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Refunded",
                                    color: Colors.gray,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Shipped",
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              buildCell('\$312.00'),
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
                          TableRow(
                            cells: [
                              buildCell('#ORD-0005'),
                              buildCell('Jun 16, 2026, 08:39 AM'),
                              buildCell('Linda Wu'),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Paid",
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Badge(
                                    child: "Shipped",
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              buildCell('\$890.99'),
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

class Badge extends StatelessWidget {
  final String child;
  final Color color;

  const Badge({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text(child, style: TextStyle(color: Colors.white)).xSmall,
    );
  }
}
