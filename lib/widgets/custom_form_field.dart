import 'package:shadcn_flutter/shadcn_flutter.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final bool showForgotPassword;
  final bool isTextArea;
  final bool expandableHeight;
  final double initialHeight;

  const CustomFormField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.showForgotPassword = false,
    this.isTextArea = false,
    this.expandableHeight = false,
    this.initialHeight = 75,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      key: FormKey(UniqueKey()),
      label: Text(label),
      trailingLabel: showForgotPassword
          ? TextButton(
              onPressed: () {},
              density: ButtonDensity.iconDense,
              size: ButtonSize.small,
              child: const Text('Forgot Password'),
            )
          : null,
      child: isTextArea
          ? TextArea(
              initialValue: placeholder,
              expandableHeight: expandableHeight,
              initialHeight: initialHeight,
            )
          : TextField(
              controller: controller,
              placeholder: Text(placeholder),
              obscureText: isPassword,
              features: [
                InputFeature.leading(Icon(icon)),
                InputFeature.clear(
                  visibility:
                      (InputFeatureVisibility.textNotEmpty &
                          InputFeatureVisibility.focused) |
                      InputFeatureVisibility.hovered,
                ),
                if (isPassword)
                  InputFeature.passwordToggle(mode: PasswordPeekMode.toggle),
              ],
            ),
    );
  }
}
