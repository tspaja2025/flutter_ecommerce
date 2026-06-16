import 'package:shadcn_flutter/shadcn_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<AuthScreen> {
  bool showRegisterPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const LogoSection(),
                  const SizedBox(height: 40),
                  showRegisterPage ? const RegisterCard() : const LoginCard(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        showRegisterPage
                            ? "Already have an account? "
                            : "Don't have an account? ",
                        style: TextStyle(color: Colors.gray.shade500),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showRegisterPage = !showRegisterPage;
                          });
                        },
                        child: Text(
                          showRegisterPage ? "Sign In" : "Create an account",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withValues(alpha: 0.5),
                blurRadius: 20,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "E",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "E-commerce",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "E-commerce Suite Management",
          style: TextStyle(color: Colors.gray.shade500),
        ),
      ],
    );
  }
}

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Sign In").bold.large,
          const Text("Enter you credentials to access your dashboard."),

          const SizedBox(height: 16),

          FormField(
            key: FormKey(#email),
            label: const Text("Email Address"),
            child: TextField(
              placeholder: const Text("name@company.com"),
              features: [
                InputFeature.leading(Icon(Icons.email)),
                InputFeature.clear(
                  visibility:
                      (InputFeatureVisibility.textNotEmpty &
                          InputFeatureVisibility.focused) |
                      InputFeatureVisibility.hovered,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FormField(
            key: FormKey(#password),
            label: const Text("Password"),
            child: TextField(
              placeholder: const Text("Password"),
              features: [
                InputFeature.leading(Icon(Icons.lock)),
                InputFeature.clear(
                  visibility: InputFeatureVisibility.textNotEmpty,
                ),
                InputFeature.passwordToggle(mode: PasswordPeekMode.toggle),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            onPressed: () {},
            alignment: Alignment.center,
            child: const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}

class RegisterCard extends StatefulWidget {
  const RegisterCard({super.key});

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Sign In").bold.large,
          const Text("Enter you credentials to access your dashboard."),

          const SizedBox(height: 16),

          FormField(
            key: FormKey(#username),
            label: const Text("Username"),
            child: TextField(
              placeholder: const Text("name@company.com"),
              features: [
                InputFeature.leading(Icon(Icons.person)),
                InputFeature.clear(
                  visibility:
                      (InputFeatureVisibility.textNotEmpty &
                          InputFeatureVisibility.focused) |
                      InputFeatureVisibility.hovered,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FormField(
            key: FormKey(#email),
            label: const Text("Email Address"),
            child: TextField(
              placeholder: const Text("name@company.com"),
              features: [
                InputFeature.leading(Icon(Icons.email)),
                InputFeature.clear(
                  visibility:
                      (InputFeatureVisibility.textNotEmpty &
                          InputFeatureVisibility.focused) |
                      InputFeatureVisibility.hovered,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FormField(
            key: FormKey(#password),
            label: const Text("Password"),
            child: TextField(
              placeholder: const Text("Password"),
              features: [
                InputFeature.leading(Icon(Icons.lock)),
                InputFeature.clear(
                  visibility: InputFeatureVisibility.textNotEmpty,
                ),
                InputFeature.passwordToggle(mode: PasswordPeekMode.toggle),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            onPressed: () {},
            alignment: Alignment.center,
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
