import 'package:shadcn_flutter/shadcn_flutter.dart';

class Badge extends StatelessWidget {
  final String label;
  final Color color;
  final bool outlined;

  const Badge({
    super.key,
    required this.label,
    required this.color,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: outlined ? null : color.withValues(alpha: 0.8),
        border: outlined ? Border.all(color: color) : null,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text(
        label,
        style: TextStyle(
          color: outlined ? color : Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
