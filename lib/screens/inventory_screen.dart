import 'package:flutter_ecommerce/shared/dashboard_layout.dart';
import 'package:flutter_ecommerce/widgets/badge.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Inventory {
  final String id;
  final String product;
  final String sku;
  final String category;
  final double price;
  final double stockLevel;
  final StockStatus stockStatus;

  const Inventory({
    required this.id,
    required this.product,
    required this.sku,
    required this.category,
    required this.price,
    required this.stockLevel,
    required this.stockStatus,
  });

  Color get stockColor {
    switch (stockStatus) {
      case StockStatus.inStock:
        return Colors.green;
      case StockStatus.lowStock:
        return Colors.orange;
      case StockStatus.outOfStock:
        return Colors.gray;
    }
  }

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  double get stockPercentage => (stockLevel / 100).clamp(0.0, 1.0);
}

enum StockStatus { outOfStock, lowStock, inStock }

class InventoryData {
  static const stock = [
    Inventory(
      id: "1",
      product: 'Lunar Horizon Watch',
      sku: 'WA-9821-LH',
      category: 'Electronics',
      price: 249.00,
      stockLevel: 85.0,
      stockStatus: StockStatus.inStock,
    ),
    Inventory(
      id: "2",
      product: 'SonicFlow Wireless',
      sku: 'HP-2044-SF',
      category: 'Electronics',
      price: 189.50,
      stockLevel: 12.0,
      stockStatus: StockStatus.lowStock,
    ),
    Inventory(
      id: "3",
      product: 'Nexus Tab Pro',
      sku: 'TB-4410-NX',
      category: 'Computing',
      price: 799.00,
      stockLevel: 0.0,
      stockStatus: StockStatus.outOfStock,
    ),
    Inventory(
      id: "4",
      product: 'Aura 15 Smartphone',
      sku: 'PH-1500-AU',
      category: 'Electronics',
      price: 1099.00,
      stockLevel: 51.0,
      stockStatus: StockStatus.inStock,
    ),
  ];
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  CheckboxState _state = CheckboxState.unchecked;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(title: 'Inventory', child: _buildContent());
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Product Inventory').large.bold,
                  const Text(
                    'Manage your catalog, stock levels, and pricing details.',
                  ).muted,
                ],
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: () {},
                leading: const Icon(Icons.add),
                child: const Text('Add Product'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Row(
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 400,
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
                      const Spacer(),
                      OutlineButton(
                        onPressed: () {},
                        child: const Text('All Categories'),
                      ),
                      OutlineButton(
                        onPressed: () {},
                        child: const Text('All Status'),
                      ),
                      OutlineButton(
                        onPressed: () {},
                        child: const Text('More Filters'),
                      ),
                      IconButton.outline(
                        onPressed: () {},
                        icon: const Icon(Icons.download_outlined),
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
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Table(
                        columnWidths: {
                          0: FixedTableSize(32),
                          1: FixedTableSize(170),
                        },
                        rows: [
                          // Header
                          TableRow(
                            cells: [
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.centerLeft,
                                  child: Checkbox(
                                    state: _state,
                                    onChanged: (value) {
                                      setState(() {
                                        _state = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              buildHeaderCell('Product'),
                              buildHeaderCell('Sku'),
                              buildHeaderCell('Category'),
                              buildHeaderCell('Price'),
                              buildHeaderCell('Stock level'),
                              buildHeaderCell('Status'),
                              buildHeaderCell('Action', true),
                            ],
                          ),
                          // Body
                          for (final inventory in InventoryData.stock)
                            TableRow(
                              cells: [
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    child: Checkbox(
                                      state: _state,
                                      onChanged: (value) {
                                        setState(() {
                                          _state = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                buildCell(inventory.product),
                                buildCell(inventory.sku),
                                buildCell(inventory.category),
                                buildCell('\$${inventory.price}'),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Progress(
                                        progress: inventory.stockLevel,
                                        min: 0,
                                        max: 100,
                                        color: inventory.stockColor,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    child: Badge(
                                      label: inventory.stockStatus.name,
                                      color: inventory.stockColor,
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
