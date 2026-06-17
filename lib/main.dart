import 'package:flutter_ecommerce/screens/settings_screen.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  runApp(const FlutterEcommerceApp());
}

class FlutterEcommerceApp extends StatelessWidget {
  const FlutterEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-Commerce App',
      theme: ThemeData(colorScheme: ColorSchemes.lightNeutral),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          headers: [
            AppBar(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.accent.withValues(alpha: 0.4),
              leading: [
                IconButton.ghost(
                  onPressed: () {
                    setState(() => expanded = !expanded);
                  },
                  icon: const Icon(Icons.menu),
                ),
              ],
              title: const Text('E-commerce Dashboard'),
              trailingGap: 8,
              trailing: [
                SizedBox(
                  width: 200,
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
                const VerticalDivider(),
                IconButton.ghost(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
                IconButton.ghost(
                  onPressed: () {},
                  icon: const Icon(Icons.dark_mode),
                ),
              ],
            ),
            const Divider(),
          ],
          child: Row(
            children: [
              NavigationDrawerWidget(expanded: expanded),
              const VerticalDivider(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SettingsScreen(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationDrawerWidget extends StatefulWidget {
  final bool expanded;

  const NavigationDrawerWidget({super.key, this.expanded = true});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  String selected = 'Dashboard';

  NavigationItem buildButton(String text, IconData icon) {
    return NavigationItem(
      label: Text(text),
      selectedStyle: const ButtonStyle.primaryIcon(),
      selected: selected == text,
      onChanged: (selected) {
        if (selected) {
          setState(() {
            this.selected = text;
          });
        }
      },
      child: Icon(icon),
    );
  }

  NavigationGroup buildLabel(String label, List<Widget> children) {
    return NavigationGroup(
      labelAlignment: Alignment.centerLeft,
      label: Text(label).semiBold.muted.xSmall,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.accent.withValues(alpha: 0.4),
      labelType: NavigationLabelType.expanded,
      labelPosition: NavigationLabelPosition.end,
      alignment: NavigationRailAlignment.start,
      expandedSize: 250,
      expanded: widget.expanded,
      footer: [
        Builder(
          builder: (context) {
            return NavigationSlot(
              leading: Avatar(
                size: 32,
                initials: 'TS',
                backgroundColor: Colors.green.shade800,
              ),
              title: const Text('tspaja2025').medium.small,
              subtitle: const Text('name@company.com').xSmall.normal,
              trailing: const Icon(LucideIcons.chevronsUpDown).iconSmall,
              onPressed: () {
                showDropdown(
                  context: context,
                  anchorAlignment: AlignmentDirectional.centerEnd,
                  alignment: AlignmentDirectional.centerStart,
                  offset: const Offset(16, 0),
                  builder: (context) {
                    return DropdownMenu(
                      children: [
                        MenuButton(
                          leading: const Icon(Icons.person),
                          child: const Text('Profile'),
                          onPressed: (ctx) {},
                        ),
                        MenuButton(
                          leading: const Icon(Icons.settings),
                          child: const Text('Settings'),
                          onPressed: (ctx) {},
                        ),
                        const MenuDivider(),
                        MenuButton(
                          leading: const Icon(Icons.logout),
                          child: const Text('Logout'),
                          onPressed: (ctx) {},
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ],
      children: [
        buildButton('Dashboard', Icons.dashboard_outlined),
        buildButton('Inventory', Icons.inventory_2_outlined),
        buildButton('Orders', Icons.shopping_cart_outlined),
        buildButton('Customers', Icons.people_outline),
        buildButton('Analytics', Icons.analytics_outlined),
      ],
    );
  }
}
