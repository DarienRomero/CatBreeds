import 'package:cat_breeds/core/utils.dart';
import 'package:flutter/material.dart';

/// A widget for adding vertical spacing between elements.
///
/// The height of the spacing is calculated as a percentage of the screen height.
/// This widget is useful for creating consistent vertical spacing in responsive layouts.
///
/// Example usage:
/// ```dart
/// Column(
///   children: [
///     Text("Title"),
///     VSpacing(2), // Adds vertical spacing equivalent to 2% of the screen height.
///     Text("Subtitle"),
///   ],
/// )
/// ```
class VSpacing extends StatelessWidget {
  /// The height of the spacing as a percentage of the screen height.
  final double percentage;

  /// Creates a widget for vertical spacing with a customizable height.
  ///
  /// [percentage] defines the height as a percentage of the screen height.
  const VSpacing(this.percentage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mqHeigth(context, percentage),
    );
  }
}
