import 'package:flutter/material.dart';
import 'package:lms_app/core/base/base_view.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: Text(
          'Chat Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
