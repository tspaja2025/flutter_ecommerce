import 'package:flutter_ecommerce/screens/auth_screen.dart';
import 'package:flutter_ecommerce/screens/customers_screen.dart';
import 'package:flutter_ecommerce/screens/dashboard_screen.dart';
import 'package:flutter_ecommerce/screens/inventory_screen.dart';
import 'package:flutter_ecommerce/screens/orders_screen.dart';
import 'package:flutter_ecommerce/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  runApp(const FlutterEcommerceApp());
}

class FlutterEcommerceApp extends StatelessWidget {
  const FlutterEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-Commerce App',
      theme: ThemeData(colorScheme: ColorSchemes.lightNeutral),
      routerConfig: GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, state) => const AuthScreen()),
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/inventory',
            builder: (context, state) => const InventoryScreen(),
          ),
          GoRoute(
            path: '/orders',
            builder: (context, state) => const OrdersScreen(),
          ),
          GoRoute(
            path: '/customers',
            builder: (context, state) => const CustomersScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    );
  }
}
