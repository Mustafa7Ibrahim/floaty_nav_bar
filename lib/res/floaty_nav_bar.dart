import 'package:floaty_nav_bar/res/models/floaty_action_button.dart';
import 'package:floaty_nav_bar/res/models/floaty_shape.dart';
import 'package:floaty_nav_bar/res/models/floaty_tab.dart';
import 'package:floaty_nav_bar/res/utils/context_extension.dart';
import 'package:floaty_nav_bar/res/widgets/floaty_item.dart';
import 'package:floaty_nav_bar/res/widgets/gap_box.dart';
import 'package:flutter/material.dart';

/// A customizable floating navigation bar that displays tabs and an action button.
///
/// The [FloatyNavBar] widget allows users to navigate between tabs while providing
/// an action button that can perform a specific action related to the selected tab.
/// It supports custom shapes, styles, and animations.
class FloatyNavBar extends StatefulWidget {
  /// Creates a [FloatyNavBar].
  ///
  /// The [tabs] parameter is required and provides the list of tabs to display in
  /// the navigation bar. The [selectedTab] parameter specifies the index of the
  /// currently selected tab.
  ///
  /// The following parameters are optional:
  /// - [margin]: The margin around the navigation bar.
  /// - [height]: The height of the navigation bar. Defaults to 60.
  /// - [gap]: The gap between the tab bar and the action button. Defaults to 16.
  /// - [backgroundColor]: The background color of the navigation bar.
  /// - [boxShadow]: The shadow effect applied to the navigation bar.
  /// - [shape]: The shape of the navigation bar. Defaults to [CircleShape].
  const FloatyNavBar({
    super.key,
    required this.tabs,
    required this.selectedTab,
    this.margin = const EdgeInsetsDirectional.symmetric(vertical: 16),
    this.height = 60,
    this.gap = 16,
    this.backgroundColor,
    this.boxShadow,
    this.shape = const CircleShape(),
  });

  /// The list of tabs to be displayed in the navigation bar.
  final List<FloatyTab> tabs;

  /// The index of the currently selected tab.
  final int selectedTab;

  /// The height of the navigation bar.
  final double height;

  /// The gap between the tab bar and the action button.
  final double gap;

  /// The margin around the navigation bar.
  final EdgeInsetsGeometry? margin;

  /// The background color of the navigation bar.
  final Color? backgroundColor;

  /// The shadow effect applied to the navigation bar.
  final List<BoxShadow>? boxShadow;

  /// The shape of the navigation bar.
  ///
  /// The default shape is [CircleShape].
  ///
  /// Subclasses include:
  /// - [CircleShape]: A circular shape with rounded corners.
  /// - [RectangleShape]: A rectangular shape with customizable corner radius.
  /// - [SquircleShape]: A squircle shape with a continuous curve for the border.
  ///
  /// You can create custom shapes by extending the [FloatyShape] class.
  final FloatyShape shape;

  @override
  State<FloatyNavBar> createState() => _FloatyNavBarState();
}

class _FloatyNavBarState extends State<FloatyNavBar> {
  late FloatyActionButton? _floatyStyle;

  @override
  void initState() {
    super.initState();
    // Initialize the action button style based on the selected tab.
    _floatyStyle = widget.tabs[widget.selectedTab].floatyActionButton;
  }

  @override
  void didUpdateWidget(covariant FloatyNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the action button style if the selected tab has changed.
    if (oldWidget.selectedTab != widget.selectedTab) {
      setState(() {
        _floatyStyle = widget.tabs[widget.selectedTab].floatyActionButton;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: widget.height,
        margin: widget.margin,
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: ShapeDecoration(
                color: widget.backgroundColor ?? context.surfaceColor,
                shape: widget.shape.shapeBorder,
                shadows: widget.boxShadow ?? [context.boxShadow],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.tabs.map((tab) {
                  return FloatyTabWidget(floatyTab: tab, shape: widget.shape);
                }).toList(),
              ),
            ),
            AnimatedSize(
              duration: context.fastDuration,
              child: _floatyStyle == null
                  ? const GapBox()
                  : GapBox(gap: widget.gap),
            ),
            AnimatedSize(
              duration: context.mediumDuration,
              curve: Curves.easeInOut,
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              child: SizedBox(
                height: _floatyStyle?.size ?? 0,
                width: _floatyStyle?.size ?? 0,
                child: FloatingActionButton(
                  shape: widget.shape.shapeBorder,
                  backgroundColor:
                      _floatyStyle?.backgroundColor ?? context.primaryColor,
                  foregroundColor:
                      _floatyStyle?.foregroundColor ?? context.onPrimaryColor,
                  onPressed: _floatyStyle?.onTap,
                  child: AnimatedSwitcher(
                    duration: context.mediumDuration,
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: _floatyStyle?.icon != null
                        ? KeyedSubtree(
                            key: ValueKey(_floatyStyle!.icon.hashCode),
                            child: _floatyStyle!.icon,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
