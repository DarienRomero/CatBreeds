import 'package:cat_breeds/core/utils.dart';
import 'package:flutter/material.dart';

/// A widget for adding horizontal spacing between elements.
///
/// The width of the spacing is calculated as a percentage of the screen width.
/// This widget is useful for creating consistent spacing in responsive layouts.
///
/// Example usage:
/// ```dart
/// Row(
///   children: [
///     Icon(Icons.star),
///     HSpacing(5), // Adds horizontal spacing equivalent to 5% of the screen width.
///     Text("Favorite"),
///   ],
/// )
/// ```
class HSpacing extends StatelessWidget {
  /// The width of the spacing as a percentage of the screen width.
  final double percentage;

  /// Creates a widget for horizontal spacing with a customizable width.
  ///
  /// [percentage] defines the width as a percentage of the screen width.
  const HSpacing(this.percentage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mqWidth(context, percentage),
    );
  }
}
