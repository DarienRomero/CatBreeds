import 'package:cat_breeds/core/utils.dart';
import 'package:flutter/material.dart';

/// A customizable icon button with flexible size, shape, and behavior options.
///
/// This widget allows you to:
/// - Define a square button with a configurable size.
/// - Add a customizable icon.
/// - Adjust the border and background styles.
/// - Support both press and long-press gestures.
///
/// Example usage:
/// ```dart
/// CustomIconButton(
///   size: 50,
///   onPressed: () {
///     print('Icon button pressed');
///   },
///   icon: Icon(Icons.star, color: Colors.white),
///   fillColor: Colors.blue,
///   borderColor: Colors.white,
///   splashColor: Colors.red,
/// )
/// ```
class CustomIconButton extends StatelessWidget {
  /// The size of the button (width and height).
  /// If `heightRef` is `false`, size is based on screen width; otherwise, it's based on screen height.
  final double size;

  /// The callback triggered when the button is pressed.
  final Function() onPressed;

  /// The optional callback triggered when the button is long-pressed.
  final Function()? onLongPress;

  /// The widget displayed inside the button, typically an icon.
  final Widget icon;

  /// The border radius of the button. Defaults to `100` for a circular button.
  final double borderRadius;

  /// The background color of the button.
  final Color? fillColor;

  /// The border color of the button. Defaults to transparent if not specified.
  final Color? borderColor;

  /// The size of the icon relative to the button size. Defaults to `0.6` (60%).
  final double iconPer;

  /// The color of the splash effect when the button is pressed.
  final Color? splashColor;

  /// Whether the size of the button is relative to the screen height (`true`) or width (`false`).
  final bool heightRef;

  /// The width of the button border. Defaults to `1`.
  final double borderWidth;

  /// Creates a customizable icon button widget.
  const CustomIconButton({
    super.key,
    required this.size,
    required this.onPressed,
    this.onLongPress,
    required this.icon,
    this.borderRadius = 100,
    this.fillColor,
    this.borderColor,
    this.iconPer = 0.6,
    this.splashColor,
    this.heightRef = false,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: !heightRef ? mqWidth(context, size) : mqHeigth(context, size),
        minHeight: !heightRef ? mqWidth(context, size) : mqHeigth(context, size),
        maxHeight: !heightRef ? mqWidth(context, size) : mqHeigth(context, size),
        maxWidth: !heightRef ? mqWidth(context, size) : mqHeigth(context, size),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth,
        ),
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        elevation: 0,
        fillColor: fillColor ?? Theme.of(context).cardColor,
        splashColor: splashColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: SizedBox(
          width: mqWidth(context, size * iconPer),
          child: icon,
        ),
      ),
    );
  }
}
