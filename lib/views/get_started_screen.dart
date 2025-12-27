import 'package:ai_lab_report_analyzer/utils/routes.dart';
import 'package:ai_lab_report_analyzer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            spacing: 16,
            children: [
              Spacer(),
              Text(
                'Understanding Your Lab Results',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                textAlign: .center,
              ),
              Text(
                "Get instant AI-powered explainations for your medical reports. Simple, secure, and clear.",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                textAlign: .center,
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 0.5),
                ),
                child: Row(
                  mainAxisAlignment: .center,
                  mainAxisSize: .min,
                  spacing: 8,
                  children: [
                    Icon(Icons.lock, color: Colors.blue, size: 16),
                    Text(
                      'PRIVATE & SECURE',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.blueGrey,
                      ),
                      textAlign: .center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              CustomElevatedButton(
                text: 'Create Free Account',
                showShadow: true,
                onPressed: () => context.push(AppRoutes.rSignup),
              ),
              CustomTextButton(
                text: 'Log In',
                onPressed: () => context.push(AppRoutes.rLogin),
                enabledBorders: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
