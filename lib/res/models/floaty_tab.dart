import 'package:floaty_nav_bar/res/models/floaty_action_button.dart';
import 'package:flutter/material.dart';

/// A class that represents a tab in a floating navigation bar.
///
/// [FloatyTab] contains information about the tab's state, appearance, and actions.
/// Each tab can have an associated icon, title, and a floating action button for additional functionality.
class FloatyTab {
  /// Creates a [FloatyTab] instance with the specified properties.
  ///
  /// The [isSelected] parameter indicates whether the tab is currently selected.
  /// The [title] parameter sets the text displayed on the tab.
  /// The [onTap] parameter is a callback function that is invoked when the tab is tapped.
  /// The [icon] parameter specifies the icon displayed on the tab.
  /// The [titleStyle] parameter allows customization of the text style for the title.
  /// The [floatyActionButton] parameter can be used to associate a floating action button with the tab.
  /// The [margin] parameter sets the margin around the tab, defaulting to 4 pixels on all sides.
  /// The [selectedColor] and [unselectedColor] parameters define the colors of the tab in selected
  /// and unselected states respectively.
  const FloatyTab({
    required this.isSelected,
    required this.title,
    required this.onTap,
    required this.icon,
    this.titleStyle,
    this.floatyActionButton,
    this.margin = const EdgeInsets.all(4),
    this.selectedColor,
    this.unselectedColor,
  });

  /// Indicates whether the tab is currently selected.
  final bool isSelected;

  /// The title text displayed on the tab.
  final String title;

  /// The style applied to the title text.
  final TextStyle? titleStyle;

  /// The icon displayed on the tab.
  final Widget icon;

  /// A callback function that is called when the tab is tapped.
  final VoidCallback onTap;

  /// An optional floating action button associated with the tab.
  final FloatyActionButton? floatyActionButton;

  /// The margin around the tab, defaulting to 4 pixels on all sides.
  final EdgeInsetsGeometry margin;

  /// The color of the tab when it is selected.
  final Color? selectedColor;

  /// The color of the tab when it is unselected.
  final Color? unselectedColor;

  /// Creates a copy of the current [FloatyTab] instance with optional modifications.
  ///
  /// This method allows you to create a new [FloatyTab] while preserving the current state,
  /// and selectively updating properties such as [isSelected], [title], [titleStyle], [icon],
  /// [onTap], [floatyActionButton], [margin], [selectedColor], and [unselectedColor].
  /// If a property is not provided, the original value from the current instance will be used.
  FloatyTab copyWith({
    bool? isSelected,
    String? title,
    TextStyle? titleStyle,
    Widget? icon,
    VoidCallback? onTap,
    FloatyActionButton? floatyActionButton,
    EdgeInsetsGeometry? margin,
    Color? selectedColor,
    Color? unselectedColor,
  }) {
    return FloatyTab(
      isSelected: isSelected ?? this.isSelected,
      title: title ?? this.title,
      titleStyle: titleStyle ?? this.titleStyle,
      icon: icon ?? this.icon,
      onTap: onTap ?? this.onTap,
      floatyActionButton: floatyActionButton ?? this.floatyActionButton,
      margin: margin ?? this.margin,
      selectedColor: selectedColor ?? this.selectedColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
    );
  }
}
