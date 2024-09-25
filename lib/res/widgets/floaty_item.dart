import 'package:floaty_nav_bar/res/models/floaty_shape.dart';
import 'package:floaty_nav_bar/res/models/floaty_tab.dart';
import 'package:floaty_nav_bar/res/utils/context_extension.dart';
import 'package:flutter/material.dart';

/// A widget that represents a single tab in the floating navigation bar.
///
/// The [FloatyTabWidget] displays an icon and a title, and visually indicates
/// whether it is selected. The widget supports animations for smooth transitions
/// between states.
class FloatyTabWidget extends StatelessWidget {
  /// Creates a [FloatyTabWidget].
  ///
  /// The [floatyTab] parameter is required and provides the data for the tab,
  /// including its icon, title, and selection state.
  ///
  /// The [shape] parameter defines the shape of the tab's decoration and defaults to [CircleShape].
  const FloatyTabWidget({
    super.key,
    required this.floatyTab,
    this.shape = const CircleShape(),
  });

  /// The data model for the tab, containing its properties.
  final FloatyTab floatyTab;

  /// The shape of the tab's decoration, which determines its visual appearance.
  final FloatyShape shape;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: floatyTab.onTap,
      child: AnimatedContainer(
        duration: context.mediumDuration,
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: floatyTab.isSelected ? 14 : 18,
          vertical: 10,
        ),
        decoration: ShapeDecoration(
          color: floatyTab.isSelected
              ? floatyTab.selectedColor ?? context.primaryColor
              : floatyTab.unselectedColor ?? context.surfaceColor,
          shape: shape.shapeBorder,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: context.mediumDuration,
              curve: Curves.easeInOut,
              child: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(
                    size: floatyTab.isSelected ? 24.0 : 22.0,
                    color: floatyTab.isSelected
                        ? context.onPrimaryColor
                        : context.onSurfaceColor,
                  ),
                ),
                child: floatyTab.icon,
              ),
            ),
            AnimatedOpacity(
              opacity: floatyTab.isSelected ? 1.0 : 0.0,
              duration: context.slowDuration,
              child: AnimatedSize(
                duration: context.slowDuration,
                curve: Curves.easeInOut,
                child: !floatyTab.isSelected
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsetsDirectional.only(start: 6),
                        child: Text(floatyTab.title, style: context.titleStyle),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
