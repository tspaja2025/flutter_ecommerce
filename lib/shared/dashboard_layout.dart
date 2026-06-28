import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class DashboardLayout extends StatefulWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;

  const DashboardLayout({
    super.key,
    required this.title,
    required this.child,
    this.actions,
  });

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
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
              title: Text(widget.title),
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
                if (widget.actions != null) ...widget.actions!,
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
                  child: widget.child,
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
  NavigationItem buildButton(
    BuildContext context,
    String label,
    IconData icon,
    String route,
  ) {
    final location = GoRouter.of(context).state.uri.path;

    return NavigationItem(
      label: Text(label),
      selected: location == route,
      selectedStyle: const ButtonStyle.primaryIcon(),
      onChanged: (selected) {
        if (selected) {
          context.go(route);
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
        buildButton(
          context,
          'Dashboard',
          Icons.dashboard_outlined,
          '/dashboard',
        ),
        buildButton(
          context,
          'Inventory',
          Icons.inventory_2_outlined,
          '/inventory',
        ),
        buildButton(context, 'Orders', Icons.shopping_cart_outlined, '/orders'),
        buildButton(context, 'Customers', Icons.people_outline, '/customers'),
      ],
    );
  }
}
