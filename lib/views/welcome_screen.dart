import 'package:ai_lab_report_analyzer/widgets/custom_elevated_button.dart';
import 'package:ai_lab_report_analyzer/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: .center,
            spacing: 16,
            children: [
              Spacer(),
              Text(
                'Clarity, finally.',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Upload your lad results and let our AI explain exactly what they mean in plain English.\nNo medical degree required.",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              CustomElevatedButton(
                text: 'Get Started',
                showShadow: true,
                onPressed: () {},
              ),
              CustomTextButton(text: 'Log In', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
