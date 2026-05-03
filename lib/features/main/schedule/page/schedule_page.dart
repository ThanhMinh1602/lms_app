import 'package:flutter/material.dart';
import 'package:lms_app/core/base/base_view.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: Text(
          'Schedule Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
