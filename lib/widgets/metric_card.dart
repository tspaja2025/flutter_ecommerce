import 'package:shadcn_flutter/shadcn_flutter.dart';

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
