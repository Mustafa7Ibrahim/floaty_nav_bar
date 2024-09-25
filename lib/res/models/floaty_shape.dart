import 'package:flutter/material.dart';

/// An abstract class that represents a shape for a floating action button or navigation bar.
///
/// This class provides a common interface for different shapes, allowing for customizable
/// button designs. Each shape must implement the [ShapeBorder] property to define its
/// specific border configuration.
///
/// Subclasses include:
/// - [CircleShape]: A circular shape with rounded corners.
/// - [RectangleShape]: A rectangular shape with customizable corner radius.
/// - [SquircleShape]: A squircle shape with a continuous curve for the border.
abstract class FloatyShape {
  const FloatyShape();

  /// A [ShapeBorder] that represents the specific shape.
  ///
  /// Implement this in subclasses to return the shape-specific border configuration.
  ShapeBorder get shapeBorder;
}

/// A circular shape for a floating action button or navigation bar.
///
/// This shape creates a circular button with a border radius of 100, making it suitable
/// for typical floating action button designs.
class CircleShape extends FloatyShape {
  const CircleShape();

  @override
  ShapeBorder get shapeBorder => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      );
}

/// A rectangular shape for a floating action button or navigation bar.
///
/// This shape allows customization of the corner radius using the [radius] parameter.
/// If no [radius] is provided, the default value is 12, creating a button with slightly
/// rounded corners.
class RectangleShape extends FloatyShape {
  /// The radius used to round the corners of the rectangle.
  ///
  /// Defaults to 12, but can be customized for more pronounced corner rounding.
  final double radius;

  const RectangleShape({this.radius = 12});

  @override
  ShapeBorder get shapeBorder => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      );
}

/// A squircle (superellipse) shape for a floating action button or navigation bar.
///
/// This shape uses a continuous curve for the border, offering a modern look. The corner
/// rounding can be customized using the [radius] property, with a default value of 24.
class SquircleShape extends FloatyShape {
  /// The radius used to round the squircle corners.
  ///
  /// Defaults to 24, but can be customized for a different appearance.
  final double radius;

  const SquircleShape({this.radius = 24});

  @override
  ShapeBorder get shapeBorder => ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      );
}
