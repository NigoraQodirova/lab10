import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetOne(),
          WidgetTwo(),
          WidgetThree(),
        ],
      ),
    );
  }
}

class WidgetOne extends StatefulWidget {
  const WidgetOne({super.key});

  @override
  _WidgetOneState createState() => _WidgetOneState();
}

class _WidgetOneState extends State<WidgetOne> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(seconds: 3),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (BuildContext context, double value, Widget? child) {
        _opacity = value;
        return Opacity(
          opacity: _opacity,
          child: const Text('Widget One', style: TextStyle(fontSize: 30, color: Colors.red)),
        );
      },
    );
  }
}

class WidgetTwo extends StatelessWidget {
  const WidgetTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Widget Two');
  }
}

class WidgetThree extends StatelessWidget {
  const WidgetThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Widget Three');
  }
}