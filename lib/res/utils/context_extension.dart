import 'package:flutter/material.dart';

/// A set of extension methods for the [BuildContext] class to provide easy access
/// to commonly used theme data, colors, durations, and shapes.
///
/// This extension allows for more readable and concise code by providing properties
/// that encapsulate common UI elements and styles.
extension ContextEx on BuildContext {
  /// Gets the current [ThemeData] associated with the context.
  ThemeData get _theme => Theme.of(this);

  /// Gets the [ColorScheme] of the current theme.
  ColorScheme get _colorScheme => _theme.colorScheme;

  /// The primary color from the current theme's color scheme.
  Color get primaryColor => _colorScheme.primary;

  /// The surface color from the current theme's color scheme.
  Color get surfaceColor => _colorScheme.surface;

  /// The color used for text or icons displayed on primary color backgrounds.
  Color get onPrimaryColor => _colorScheme.onPrimary;

  /// The color used for text or icons displayed on surface color backgrounds.
  Color get onSurfaceColor => _colorScheme.onSurface;

  /// A duration for fast animations, set to 200 milliseconds.
  Duration get fastDuration => const Duration(milliseconds: 200);

  /// A duration for medium animations, set to 400 milliseconds.
  Duration get mediumDuration => const Duration(milliseconds: 400);

  /// A duration for slow animations, set to 600 milliseconds.
  Duration get slowDuration => const Duration(milliseconds: 600);

  /// Returns a rounded rectangle border with a circular radius of 100.
  ShapeBorder get roundedRectangleBorder {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(100));
  }

  /// Returns a squircle border with a circular radius of 24.
  ShapeBorder get squircleBorder {
    return ContinuousRectangleBorder(borderRadius: BorderRadius.circular(24));
  }

  /// Returns a rectangular border with rounded corners specified by the given [radius].
  ///
  /// The [radius] parameter determines the degree of rounding applied to the corners.
  ShapeBorder roundedBorder(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Retrieves the title text style from the current theme's text theme,
  /// copying it and applying a color based on the onPrimary color.
  TextStyle? get titleStyle {
    return _theme.textTheme.titleMedium?.copyWith(
      color: onPrimaryColor,
      fontSize: 14,
    );
  }

  /// A box shadow with a black color at 24% opacity, a blur radius of 10,
  /// and an offset of (0, 4).
  BoxShadow get boxShadow {
    return BoxShadow(
      color: Colors.black.withOpacity(0.24),
      blurRadius: 10,
      spreadRadius: 0.0,
      offset: const Offset(0, 4),
    );
  }
}
