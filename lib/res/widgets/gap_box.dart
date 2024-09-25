import 'package:flutter/material.dart';

/// A widget that creates a square gap of a specified size.
///
/// The [GapBox] widget is a simple [StatelessWidget] that uses a [SizedBox]
/// to create a square gap with equal width and height. The size of the gap
/// is determined by the [gap] parameter.
///
/// The [gap] parameter defaults to 0 if not provided.
///
/// Example usage:
/// ```dart
/// GapBox(gap: 10.0)
/// ```
///
/// This will create a square gap with a width and height of 10.0.
class GapBox extends StatelessWidget {
  /// Creates a [GapBox] widget with the specified gap size.
  const GapBox({super.key, this.gap = 0});

  /// The size of the gap, which determines the width and height of the square.
  final double gap;

  @override
  Widget build(BuildContext context) => SizedBox(width: gap, height: gap);
}
