import 'package:flutter/material.dart';
import 'package:lms_app/core/base/base_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: Text(
          'Dashboard Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
