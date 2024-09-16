import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Loading'),
          Expanded(
            child: Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: const Color(0xFFEA3799),
                  size: 50,
                ),
            ),
          ),
        ],
      ),
    );
  }
}
