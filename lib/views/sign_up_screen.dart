import 'package:ai_lab_report_analyzer/controller/auth_controller.dart';
import 'package:ai_lab_report_analyzer/init.dart';
import 'package:ai_lab_report_analyzer/utils/routes.dart';
import 'package:ai_lab_report_analyzer/widgets/custom_text_field.dart';
import 'package:ai_lab_report_analyzer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /// CONTROLLERS
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();

  /// INSTANCES
  late AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = serviceLocator<AuthController>();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            spacing: 10,
            children: [
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                textAlign: .start,
              ),
              Text(
                "Start understanding your health today. Get clear, AI-powered explainations for your lab results.",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                textAlign: .start,
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: .start,
                spacing: 8,
                children: [
                  Text(
                    "Name",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: .start,
                  ),
                  CustomTextField(
                    controller: _name,
                    hintText: 'Name',
                    suffixIcon: Icon(Icons.people, color: Colors.black45),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: .start,
                spacing: 8,
                children: [
                  Text(
                    "Email Address",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: .start,
                  ),
                  CustomTextField(
                    controller: _email,
                    hintText: 'name@example.com',
                    suffixIcon: Icon(Icons.email, color: Colors.black45),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: .start,
                spacing: 8,
                children: [
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: .start,
                  ),
                  CustomTextField(
                    controller: _password,
                    hintText: 'Min. 8 characters',
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Consumer<AuthController>(
                builder: (_, state, _) => CustomElevatedButton(
                  text: 'Create Account',
                  color: state.isLoading ? Colors.grey : null,
                  onPressed: state.isLoading ? null : _createAccount,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: .center,
                spacing: 5,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.black45,
                    ),
                    textAlign: .end,
                  ),
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.rLogin),
                    child: Text(
                      "Log In",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.blue,
                      ),
                      textAlign: .end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAccount() async {
    try {
      await _authController.registerUser(
        name: _name.text.trim(),
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
