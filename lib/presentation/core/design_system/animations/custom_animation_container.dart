import 'package:flutter/material.dart';

class CustomAnimationContainer extends StatefulWidget {
  const CustomAnimationContainer({super.key, required this.child});

  final Widget child;

  @override
  State<CustomAnimationContainer> createState() =>
      _CustomAnimationContainerState();
}

class _CustomAnimationContainerState extends State<CustomAnimationContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _tween = Tween<Offset>(
      begin: const Offset(0, -100),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _tween.value,
          child: widget.child,
        );
      },
    );
  }
}
