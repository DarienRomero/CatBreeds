import 'package:cat_breeds/core/utils.dart';
import 'package:cat_breeds/features/common/presentation/widgets/h_spacing.dart';
import 'package:flutter/material.dart';

/// A customizable button widget with optional leading icon, loading state, and disable functionality.
///
/// This button is designed to be flexible with width, height, colors, and additional UI elements.
/// It supports a loading state, which replaces the text with a `CircularProgressIndicator`.
///
/// ## Example Usage:
/// ```dart
/// CustomButton(
///   onPressed: () {
///     print("Button pressed!");
///   },
///   buttonText: "Click Me",
///   width: 200,
///   backgroundColor: Colors.blue,
///   loading: false,
///   disabled: false,
///   borderRadius: 12,
/// )
/// ```
class CustomButton extends StatelessWidget {
  /// Creates a customizable button.
  ///
  /// The [onPressed], [buttonText], [width], and [backgroundColor] are required.
  /// The button can also display a loading indicator or a leading icon.
  ///
  /// - If [disabled] is `true`, the button is not clickable.
  /// - If [loading] is `true`, the button shows a loading spinner instead of text.
  /// - If [leading] is provided, it appears to the left of the button text.
  const CustomButton({
    required this.onPressed, 
    required this.buttonText, 
    required this.width, 
    required this.backgroundColor, 
    super.key, 
    this.heigth = 60,
    this.borderRadius = 10,
    this.disabled = false,
    this.leading,
    this.loading = false, 
    this.labelColor = Colors.white,
    this.textColor,
  });

  /// The function that is called when the button is pressed.
  ///
  /// If `null` or if [disabled] is `true`, the button is not clickable.
  final void Function()? onPressed;

  /// The text displayed on the button.
  final String buttonText;

  /// The width of the button.
  final double width;

  /// The background color of the button.
  ///
  /// If `null`, the button uses the theme's primary color.
  final Color? backgroundColor;

  /// The height of the button. Defaults to `60`.
  final double heigth;

  /// The border radius of the button. Defaults to `10`.
  final double borderRadius;

  /// Whether the button is disabled.
  ///
  /// If `true`, the button is not clickable and appears faded.
  final bool disabled;

  /// An optional leading widget (e.g., an icon) before the button text.
  final Widget? leading;

  /// Whether the button should display a loading indicator instead of text.
  final bool loading;

  /// The color of the text label. Defaults to `Colors.white`.
  final Color labelColor;

  /// The text color. If `null`, defaults to the label color.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: MaterialButton(
        color: disabled
            ? Theme.of(context).hintColor.withOpacity(0.6)
            : backgroundColor ??
                (onPressed == null
                    ? Theme.of(context).hintColor.withOpacity(0.6)
                    : Theme.of(context).primaryColor),
        minWidth: width,
        height: heigth,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: () {
          if (disabled || loading) return;
          onPressed?.call();
        },
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              if (leading != null)
                Row(
                  children: [
                    leading!,
                    const HSpacing(1),
                  ],
                ),
              if (!loading)
                Text(
                  buttonText,
                  style: TextStyle(color: labelColor),
                  textAlign: TextAlign.center,
                )
              else
                SizedBox(
                  width: mqHeigth(context, 4),
                  height: mqHeigth(context, 4),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
