import 'package:shadcn_flutter/shadcn_flutter.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Product Inventory'),
                const Text(
                  'Manage your catalog, stock levels, and pricing details.',
                ),
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
                            buildCell('Lunar Horizon Watch'),
                            buildCell('WA-9821-LH'),
                            buildCell('Electronics'),
                            buildCell('\$249.00'),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Progress(
                                    progress: 85,
                                    min: 0,
                                    max: 100,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerLeft,
                                child: Badge(
                                  child: "In Stock",
                                  color: Colors.green,
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
                            buildCell('SonicFlow Wireless'),
                            buildCell('HP-2044-SF'),
                            buildCell('Electronics'),
                            buildCell('\$189.50'),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Progress(
                                    progress: 12,
                                    min: 0,
                                    max: 100,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerLeft,
                                child: Badge(
                                  child: "Low Stock",
                                  color: Colors.red,
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
                            buildCell('Nexus Tab Pro'),
                            buildCell('TB-4410-NX'),
                            buildCell('Computing'),
                            buildCell('\$799.00'),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Progress(
                                    progress: 0,
                                    min: 0,
                                    max: 100,
                                    color: Colors.gray,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerLeft,
                                child: Badge(
                                  child: "Out of Stock",
                                  color: Colors.gray,
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
                            buildCell('Aura 15 Smartphone'),
                            buildCell('PH-1500-AU'),
                            buildCell('Electronics'),
                            buildCell('\$1,099.00'),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Progress(
                                    progress: 45,
                                    min: 0,
                                    max: 100,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerLeft,
                                child: Badge(
                                  child: "In Stock",
                                  color: Colors.orange,
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
