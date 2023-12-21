import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomWidget(),
          AnimatedContainerWidget(),
          PhysicsBasedWidget(),
        ],
      ),
    );
  }
}

// Example Widgets for Screen 2
class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Custom Widget');
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: _isExpanded ? 200 : 100,
        color: Colors.blue,
        child: const Center(child: Text('Animated Container')),
      ),
    );
  }
}

class PhysicsBasedWidget extends StatefulWidget {
  const PhysicsBasedWidget({super.key});

  @override
  _PhysicsBasedWidgetState createState() => _PhysicsBasedWidgetState();
}

class _PhysicsBasedWidgetState extends State<PhysicsBasedWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        height: _isExpanded ? 200 : 100,
        width: _isExpanded ? 200 : 100,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(_isExpanded ? 20 : 0),
        ),
        child: const Center(
          child: Text(
            'Animated Container',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}