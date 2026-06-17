import 'package:shadcn_flutter/shadcn_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showRegisterPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const LogoSection(),
                  const SizedBox(height: 16),
                  const Text('E-commerce Suite Management').muted,
                  const SizedBox(height: 16),
                  showRegisterPage ? const SignUpCard() : const SignInCard(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        showRegisterPage
                            ? "Already have an account? "
                            : "Don't have an account? ",
                      ).small.muted,
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showRegisterPage = !showRegisterPage;
                          });
                        },
                        child: Text(
                          showRegisterPage ? 'Sign In' : 'Create an account',
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
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 20),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.shopping_bag_outlined,
            size: 48,
            color: Colors.white,
          ),
          const Icon(Icons.check, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}

class SignInCard extends StatefulWidget {
  const SignInCard({super.key});

  @override
  State<SignInCard> createState() => _SignInCardState();
}

class _SignInCardState extends State<SignInCard> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sign In').large.semiBold,
            const Text(
              'Enter your credentials to access your dashboard.',
            ).small.muted,

            const SizedBox(height: 16),

            CustomFormField(
              controller: _emailController,
              label: 'Email Address',
              placeholder: 'name@company.com',
              icon: Icons.email,
            ),

            const SizedBox(height: 16),

            CustomFormField(
              controller: _passwordController,
              label: 'Password',
              placeholder: '********',
              icon: Icons.lock,
              isPassword: true,
              showForgotPassword: true,
            ),

            const SizedBox(height: 16),

            PrimaryButton(
              onPressed: () {},
              alignment: Alignment.center,
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sign Up').large.semiBold,
            const Text('Start managing your inventory and sales today.').muted,

            const SizedBox(height: 16),

            CustomFormField(
              controller: _fullnameController,
              label: 'Full Name',
              placeholder: 'John Doe',
              icon: Icons.person,
            ),

            const SizedBox(height: 16),

            CustomFormField(
              controller: _emailController,
              label: 'Email Address',
              placeholder: 'name@company.com',
              icon: Icons.email,
            ),

            const SizedBox(height: 16),

            CustomFormField(
              controller: _passwordController,
              label: 'Password',
              placeholder: '********',
              icon: Icons.lock,
              isPassword: true,
            ),

            const SizedBox(height: 16),

            PrimaryButton(
              onPressed: () {},
              alignment: Alignment.center,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordCard extends StatefulWidget {
  const ForgotPasswordCard({super.key});

  @override
  State<ForgotPasswordCard> createState() => _ForgotPasswordCardState();
}

class _ForgotPasswordCardState extends State<ForgotPasswordCard> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Forgot Password').large.semiBold,
          const Text(
            'Enter your email address and you will receive a link to reset your password.',
          ).muted,

          const SizedBox(height: 16),

          FormField(
            key: FormKey(#email),
            label: const Text('Email Address'),
            child: TextField(
              controller: _emailController,
              placeholder: const Text('name@company.com'),
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

          PrimaryButton(
            onPressed: () {},
            alignment: Alignment.center,
            child: const Text('Send Reset Link'),
          ),
        ],
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final bool showForgotPassword;

  const CustomFormField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.showForgotPassword = false,
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
      child: TextField(
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
