import 'package:shadcn_flutter/shadcn_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Account Settings').large.bold,
              const Text(
                'Manage your profile, security settings, and global preferences',
              ).muted,
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Expanded(
                child: Card(
                  padding: const EdgeInsets.all(0),
                  borderColor: Theme.of(context).colorScheme.border,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.accent.withValues(alpha: 0.4),
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).colorScheme.border,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("USER PROFILE").medium.textSmall,
                            const Icon(Icons.person_outline),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.accent.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          spacing: 8,
                          children: [
                            OutlineButton(
                              onPressed: () {},
                              child: const Text("Discard"),
                            ),
                            PrimaryButton(
                              onPressed: () {},
                              child: const Text("Save Changes"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  padding: const EdgeInsets.all(0),
                  borderColor: Theme.of(context).colorScheme.border,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.accent.withValues(alpha: 0.4),
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).colorScheme.border,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("SECURITY").medium.textSmall,
                            const Icon(Icons.shield_outlined),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Change Password").semiBold,
                            const Text(
                              "It's a good idea to use a strong password that you don't use elsewhere.",
                            ).muted.small,

                            const SizedBox(height: 16),

                            TextField(
                              placeholder: const Text("Current Password"),
                            ),

                            const SizedBox(height: 16),

                            TextField(placeholder: const Text("New Password")),

                            const SizedBox(height: 16),

                            const Divider(),

                            const SizedBox(height: 16),

                            const Text("Two-Factor Auth").semiBold,
                            const Text(
                              "Secure your account with an extra layer of protection using your mobile device.",
                            ).muted.small,

                            const SizedBox(height: 16),

                            Switch(
                              value: value,
                              trailing: const Text(
                                "Enable 2FA via Authenticator App",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  this.value = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.accent.withValues(alpha: 0.4),
                          border: Border(
                            top: BorderSide(
                              color: Theme.of(context).colorScheme.border,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [const Text("Last changed 3 months ago")],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Expanded(
                child: Card(
                  padding: const EdgeInsets.all(0),
                  borderColor: Theme.of(context).colorScheme.border,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.accent.withValues(alpha: 0.4),
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).colorScheme.border,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "PREFERENCES & NOTIFICATIONS",
                            ).medium.textSmall,
                            const Icon(Icons.tune),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                          bottom: 0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [const Text("Notification Channels")],
                              ),
                            ),
                            const SizedBox(
                              width: 1,
                              height: 150,
                              child: VerticalDivider(),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [const Text("Localization")],
                              ),
                            ),
                            const SizedBox(
                              width: 1,
                              height: 150,
                              child: VerticalDivider(),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [const Text("Workspace")],
                              ),
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

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Expanded(
                child: Card(
                  padding: const EdgeInsets.all(0),
                  borderColor: Theme.of(context).colorScheme.border,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.accent.withValues(alpha: 0.4),
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).colorScheme.border,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "RECENT LOGIN SESSIONS",
                            ).medium.textSmall,
                            const Icon(Icons.history),
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
}
