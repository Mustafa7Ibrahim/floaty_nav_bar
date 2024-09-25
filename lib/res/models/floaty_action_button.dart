import 'package:flutter/material.dart';

/// A model class for customizing a floating action button within a navigation bar.
///
/// The [FloatyActionButton] allows you to specify a widget, action (onTap),
/// size, background color, and foreground color for a floating action button.
class FloatyActionButton {
  /// The widget displayed inside the floating action button.
  ///
  /// This can be any widget, such as an [Icon], [Text], or custom widget.
  final Widget icon;

  /// The callback function that is invoked when the button is pressed.
  ///
  /// This is required to define the action when the floating button is tapped.
  final VoidCallback onTap;

  /// The size of the floating action button.
  ///
  /// Defaults to 50. Can be customized by providing a different value.
  final double? size;

  /// The background color of the floating action button.
  ///
  /// If not specified, the theme's primary color is used.
  final Color? backgroundColor;

  /// The foreground color of the floating action button widget.
  ///
  /// This typically sets the color of the widget inside the button.
  /// If not provided, it defaults to a color contrasting with the background.
  final Color? foregroundColor;

  /// elevation of the floating action button.
  final double? elevation;

  /// Creates a [FloatyActionButton] with the given widget, onTap, and optional
  /// customization options for size, background color, and foreground color.
  ///
  /// The [icon] can be any widget (such as [Icon] or [Text]) to provide flexibility.
  FloatyActionButton({
    required this.icon,
    required this.onTap,
    this.size = 50,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
  });

  /// Returns a copy of this [FloatyActionButton] with the option to modify any
  /// of the properties.
  ///
  /// If any parameter is not specified, the current value from the original
  /// object is retained.
  FloatyActionButton copyWith({
    Widget? icon,
    VoidCallback? onTap,
    double? size,
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
  }) {
    return FloatyActionButton(
      icon: icon ?? this.icon,
      onTap: onTap ?? this.onTap,
      size: size ?? this.size,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
    );
  }
}
