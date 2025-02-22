import 'package:cat_breeds/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget for rendering scalable vector graphics (SVG) icons with customizable size and color.
///
/// This widget leverages the `flutter_svg` package to display SVG assets.
/// The size of the icon is calculated relative to the screen width using `sizePer`.
///
/// Example usage:
/// ```dart
/// CustomSVGIcon(
///   path: 'assets/icons/sample_icon.svg',
///   sizePer: 8,
///   color: Colors.blue,
/// )
/// ```
class CustomSVGIcon extends StatelessWidget {
  /// The path to the SVG asset. This must be a valid asset path in your project.
  final String path;

  /// The size of the icon as a percentage of the screen width.
  /// Defaults to `6` (6% of the screen width).
  final double sizePer;

  /// The color to apply to the SVG. If null, the SVG will use its default color(s).
  final Color? color;

  /// Creates a widget for rendering SVG icons with customizable properties.
  const CustomSVGIcon({
    super.key,
    required this.path,
    this.sizePer = 6,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: mqWidth(context, sizePer),
      height: mqWidth(context, sizePer),
      color: color,
    );
  }
}
