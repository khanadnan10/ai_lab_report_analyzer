import 'package:ai_lab_report_analyzer/widgets/custom_text_field.dart';
import 'package:ai_lab_report_analyzer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            spacing: 10,
            children: [
              Card(
                elevation: 0,
                color: Colors.blueAccent.withValues(alpha: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Icon(Icons.local_bar_outlined, color: Colors.blue),
                ),
              ),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                textAlign: .center,
              ),
              Text(
                "Decode your lab results instanty",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                textAlign: .center,
              ),
              const SizedBox(height: 8),
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
                    hintText: 'Enter your password',
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: .centerRight,
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue,
                  ),
                  textAlign: .end,
                ),
              ),
              const SizedBox(height: 10),
              CustomElevatedButton(
                text: 'Log In',
                onPressed: () {
                  print('LOGGIN TO YOUR ACCOUNT');
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: .center,
                spacing: 5,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.black45,
                    ),
                    textAlign: .end,
                  ),
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    ),
                    textAlign: .end,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
