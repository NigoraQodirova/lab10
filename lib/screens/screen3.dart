import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTransitionWidget(),
          TweenBasedAnimationWidget(),
          // Add another widget using a different transition type
        ],
      ),
    );
  }
}

// Example Widgets for Screen 3
class CustomTransitionWidget extends StatelessWidget {
  const CustomTransitionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTransitionAnimation();
  }
}

class CustomTransitionAnimation extends StatefulWidget {
  const CustomTransitionAnimation({super.key});

  @override
  _CustomTransitionAnimationState createState() => _CustomTransitionAnimationState();
}

class _CustomTransitionAnimationState extends State<CustomTransitionAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const Text('Custom Transition Animation'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TweenBasedAnimationWidget extends StatefulWidget {
  const TweenBasedAnimationWidget({super.key});

  @override
  _TweenBasedAnimationWidgetState createState() => _TweenBasedAnimationWidgetState();
}

class _TweenBasedAnimationWidgetState extends State<TweenBasedAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: const Text('Tween Based Animation'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}