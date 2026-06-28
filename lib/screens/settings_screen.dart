import 'package:flutter_ecommerce/widgets/badge.dart';
import 'package:flutter_ecommerce/widgets/custom_form_field.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value = false;
  bool _emailAlerts = false;
  bool _pushNotifications = false;
  bool _smsAlerts = false;
  bool _compactView = false;
  bool _autoRefresh = false;
  bool _showAnalyticsTips = false;
  String? interfaceLanguageValue;
  String? timezoneValue;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _accountRoleController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

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
                      SettingsCardHeader(
                        title: 'USER PROFILE',
                        icon: Icons.person_outline,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Avatar(
                                  backgroundColor: Colors.red,
                                  // Helper to derive initials from a username or full name.
                                  initials: Avatar.getInitials('TS'),
                                  provider: const NetworkImage(
                                    'https://avatars.githubusercontent.com/u/213942709?v=4',
                                  ),
                                  size: 64,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Change Photo'),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 16,
                                children: [
                                  CustomFormField(
                                    controller: _fullnameController,
                                    label: 'Full Name',
                                    placeholder: 'John Doe',
                                    icon: Icons.person,
                                  ),
                                  Row(
                                    spacing: 16,
                                    children: [
                                      Expanded(
                                        child: CustomFormField(
                                          controller: _emailController,
                                          label: 'Email Address',
                                          placeholder: 'john.doe@company.com',
                                          icon: Icons.email,
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomFormField(
                                          controller: _accountRoleController,
                                          label: 'Account Role',
                                          placeholder: 'Admin',
                                          icon: Icons.lock,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomFormField(
                                    controller: _bioController,
                                    label: 'Bio / Signature',
                                    placeholder: 'Hello, World!',
                                    icon: Icons.person,
                                    isTextArea: true,
                                    expandableHeight: true,
                                    initialHeight: 75,
                                  ),
                                ],
                              ),
                            ),
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
                              child: const Text('Discard'),
                            ),
                            PrimaryButton(
                              onPressed: () {},
                              child: const Text('Save Changes'),
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
                      SettingsCardHeader(
                        title: 'SECURITY',
                        icon: Icons.shield_outlined,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Change Password').semiBold,
                            const Text(
                              "It's a good idea to use a strong password that you don't use elsewhere.",
                            ).muted.small,

                            const SizedBox(height: 16),

                            TextField(
                              placeholder: const Text('Current Password'),
                            ),

                            const SizedBox(height: 16),

                            TextField(placeholder: const Text('New Password')),

                            const SizedBox(height: 16),

                            const Divider(),

                            const SizedBox(height: 16),

                            const Text('Two-Factor Auth').semiBold,
                            const Text(
                              'Secure your account with an extra layer of protection using your mobile device.',
                            ).muted.small,

                            const SizedBox(height: 16),

                            Switch(
                              value: value,
                              trailing: const Text(
                                'Enable 2FA via Authenticator App',
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
                          children: [const Text('Last changed 3 months ago')],
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
                      SettingsCardHeader(
                        title: 'PREFERENCES & NOTIFICATIONS',
                        icon: Icons.tune,
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
                                spacing: 16,
                                children: [
                                  const Text('Notification Channels').semiBold,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Email Alerts'),
                                      Checkbox(
                                        state: _emailAlerts
                                            ? CheckboxState.checked
                                            : CheckboxState.unchecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _emailAlerts =
                                                value == CheckboxState.checked;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Desktop Push Notifications'),
                                      Checkbox(
                                        state: _pushNotifications
                                            ? CheckboxState.checked
                                            : CheckboxState.unchecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _pushNotifications =
                                                value == CheckboxState.checked;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('SMS Critical Alerts'),
                                      Checkbox(
                                        state: _smsAlerts
                                            ? CheckboxState.checked
                                            : CheckboxState.unchecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _smsAlerts =
                                                value == CheckboxState.checked;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
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
                                spacing: 16,
                                children: [
                                  const Text('Localization').semiBold,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Select<String>(
                                          itemBuilder: (context, item) {
                                            return Text(item);
                                          },
                                          popupConstraints:
                                              const BoxConstraints(
                                                maxHeight: 300,
                                                maxWidth: 200,
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              interfaceLanguageValue = value;
                                            });
                                          },
                                          value: interfaceLanguageValue,
                                          placeholder: const Text(
                                            'Interface Language',
                                          ),
                                          popup: const SelectPopup(
                                            items: SelectItemList(
                                              children: [
                                                SelectItemButton(
                                                  value: 'English',
                                                  child: Text('English'),
                                                ),
                                              ],
                                            ),
                                          ).call,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Select<String>(
                                          itemBuilder: (context, item) {
                                            return Text(item);
                                          },
                                          popupConstraints:
                                              const BoxConstraints(
                                                maxHeight: 300,
                                                maxWidth: 200,
                                              ),
                                          onChanged: (value) {
                                            setState(() {
                                              timezoneValue = value;
                                            });
                                          },
                                          value: timezoneValue,
                                          placeholder: const Text('Timezone'),
                                          popup: const SelectPopup(
                                            items: SelectItemList(
                                              children: [
                                                SelectItemButton(
                                                  value: 'EasternTime',
                                                  child: Text('Eastern Time'),
                                                ),
                                              ],
                                            ),
                                          ).call,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                                spacing: 16,
                                children: [
                                  const Text('Workspace').semiBold,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Compact View'),
                                      Checkbox(
                                        state: _compactView
                                            ? CheckboxState.checked
                                            : CheckboxState.unchecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _compactView =
                                                value == CheckboxState.checked;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Auto-Refresh Dashboards'),
                                      Checkbox(
                                        state: _autoRefresh
                                            ? CheckboxState.checked
                                            : CheckboxState.unchecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _autoRefresh =
                                                value == CheckboxState.checked;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Show Analytics Tips'),
                                      Checkbox(
                                        state: _showAnalyticsTips
                                            ? CheckboxState.checked
                                            : CheckboxState.unchecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _showAnalyticsTips =
                                                value == CheckboxState.checked;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
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
                      SettingsCardHeader(
                        title: 'RECENT LOGIN SESSIONS',
                        icon: Icons.history,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Table(
                              rows: [
                                // Header
                                TableRow(
                                  cells: [
                                    buildHeaderCell('DEVICE / BROWSER'),
                                    buildHeaderCell('LOCATION'),
                                    buildHeaderCell('IP ADDRESS'),
                                    buildHeaderCell('LAST ACTIVITY'),
                                    buildHeaderCell('STATUS'),
                                    buildHeaderCell('ACTION', true),
                                  ],
                                ),
                                // Body
                                TableRow(
                                  cells: [
                                    buildCell('Chrome on Windows 11'),
                                    buildCell('New York, USA'),
                                    buildCell('127.0.0.1'),
                                    buildCell('Just now'),
                                    TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.centerLeft,
                                        child: Badge(
                                          label: 'Active',
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Text('Revoke'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  cells: [
                                    buildCell('Safari on IPhone 15 Pro'),
                                    buildCell('Jersey City, USA'),
                                    buildCell('127.0.0.1'),
                                    buildCell('2 days ago'),
                                    TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.centerLeft,
                                        child: Badge(
                                          label: 'Expired',
                                          color: Colors.gray,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Text('Remove'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
        child: Text(text).muted.semiBold.small,
      ),
    );
  }

  TableCell buildCell(String text, [bool alignRight = false]) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: alignRight ? Alignment.centerRight : null,
        child: Text(text).small,
      ),
    );
  }
}

class SettingsCardHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const SettingsCardHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.accent.withValues(alpha: 0.4),
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.border),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title).medium.textSmall, Icon(icon)],
      ),
    );
  }
}
