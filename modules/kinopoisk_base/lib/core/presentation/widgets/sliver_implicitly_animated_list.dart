import 'package:diffutil_sliverlist/diffutil_sliverlist.dart';
import 'dart:math' as math;

import 'package:kinopoisk_base/core/core.dart';

class SliverImplicitlyAnimatedList<T> extends StatelessWidget {
  const SliverImplicitlyAnimatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.equalityChecker,
  });

  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final bool Function(T, T) equalityChecker;

  @override
  Widget build(BuildContext context) {
    return DiffUtilSliverList<T>(
      items: items,
      builder: itemBuilder,
      equalityChecker: equalityChecker,
      insertAnimationBuilder: (_, animation, child) => _AnimatedItem(animation, child),
      removeAnimationBuilder: (_, animation, child) => _AnimatedItem(animation, child),
      insertAnimationDuration: Duration(milliseconds: 400),
      removeAnimationDuration: Duration(milliseconds: 200),
    );
  }
}

class _AnimatedItem extends StatelessWidget {
  const _AnimatedItem(this.animation, this.child);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _SizeTransition(
      axis: Axis.vertical,
      axisAlignment: 0,
      sizeFactor: CurvedAnimation(
        parent: animation,
        curve: const Interval(0.0, 0.8, curve: Curves.fastOutSlowIn),
        reverseCurve: const Interval(0.2, 1, curve: Curves.fastOutSlowIn),
      ),
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(0.5, 1, curve: Curves.linear),
        ),
        child: child,
      ),
    );
  }
}

class _SizeTransition extends AnimatedWidget {
  const _SizeTransition({
    this.axis = Axis.vertical,
    required Animation<double> sizeFactor,
    this.axisAlignment = 0,
    this.child,
  }) : super(listenable: sizeFactor);

  final Axis axis;
  Animation<double> get sizeFactor => listenable as Animation<double>;
  final double axisAlignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final AlignmentDirectional alignment;
    if (axis == Axis.vertical) {
      alignment = AlignmentDirectional(-1.0, axisAlignment);
    } else {
      alignment = AlignmentDirectional(axisAlignment, -1.0);
    }

    return Align(
      alignment: alignment,
      heightFactor: axis == Axis.vertical ? math.max(sizeFactor.value, 0.0) : null,
      widthFactor: axis == Axis.horizontal ? math.max(sizeFactor.value, 0.0) : null,
      child: child,
    );
  }
}
