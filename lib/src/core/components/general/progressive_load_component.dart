import 'package:flutter/material.dart';

class ProgressiveLoadComponent extends StatefulWidget {
  const ProgressiveLoadComponent({
    required this.onLazyLoad,
    required this.child,
    this.threshold = 0.5,
    super.key,
  });

  final VoidCallback onLazyLoad;
  final double threshold;
  final Widget child;

  @override
  State<ProgressiveLoadComponent> createState() {
    return _ProgressiveLoadComponentState();
  }
}

class _ProgressiveLoadComponentState extends State<ProgressiveLoadComponent> {
  late final ValueNotifier<bool> lazyLoadingTriggered;

  @override
  void initState() {
    super.initState();
    lazyLoadingTriggered = ValueNotifier(false);
  }

  @override
  void dispose() {
    lazyLoadingTriggered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: lazyLoadingTriggered,
      child: widget.child,
      builder: (_, child) {
        return NotificationListener<ScrollUpdateNotification>(
          onNotification: (scrollUpdate) {
            final metrics = scrollUpdate.metrics;
            final scrollPosition = metrics.pixels;
            final maxScrollExtent = metrics.maxScrollExtent;

            if (scrollPosition > maxScrollExtent * widget.threshold &&
                !lazyLoadingTriggered.value) {
              widget.onLazyLoad();
              lazyLoadingTriggered.value = true;
            }

            if (scrollPosition < maxScrollExtent * widget.threshold && lazyLoadingTriggered.value) {
              lazyLoadingTriggered.value = false;
            }

            return true;
          },
          child: child!,
        );
      },
    );
  }
}
