import 'package:shadcn_flutter/shadcn_flutter.dart';

class ListTile extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final Widget trailing;

  const ListTile({
    super.key,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: NetworkImage(url)),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title).bold, Text(subtitle).muted.small],
        ),
        const Spacer(),
        trailing,
      ],
    );
  }
}
