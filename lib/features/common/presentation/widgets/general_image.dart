import 'dart:io';

import 'package:cat_breeds/core/utils.dart';
import 'package:flutter/material.dart';

/// A versatile widget for displaying images from various sources, including network, local assets, and memory.
///
/// This widget provides options for customizing the image's size, border radius, fit, and background color.
/// It supports displaying images from:
/// - Network URLs.
/// - Local assets.
/// - Memory (file system).
///
/// Example usage:
/// ```dart
/// GeneralImage(
///   url: 'https://example.com/image.jpg',
///   width: 100,
///   height: 100,
///   borderRadius: 8,
///   fit: BoxFit.cover,
/// )
/// ```
class GeneralImage extends StatelessWidget {
  /// The width of the image. Defaults to the size of the parent container if not provided.
  final double? width;

  /// The height of the image. Defaults to the size of the parent container if not provided.
  final double? height;

  /// The source URL or path of the image.
  final String url;

  /// Whether the image is loaded from local assets. Defaults to `false`.
  final bool fromLocal;

  /// Whether the image is loaded from memory (file system). Defaults to `false`.
  final bool fromMemory;

  /// The file path for loading the image from memory. Required if `fromMemory` is `true`.
  final String? file;

  /// The border radius of the image container. Defaults to `0` (no rounded corners).
  final double borderRadius;

  /// The box fit mode for the image. Defines how the image should be resized to fit its container.
  final BoxFit? fit;

  /// The background color of the image container. Defaults to `null`.
  final Color? bgColor;

  /// Optional placeholder text. Not currently displayed in this implementation.
  final String? text;

  /// The alignment of the image within its container. Defaults to `Alignment.center`.
  final AlignmentGeometry alignment;

  /// Whether a fade-in animation is enabled for the image. Defaults to `true`.
  final bool fadeInEnabled;

  /// Creates a versatile image widget supporting multiple image sources and customization options.
  const GeneralImage({
    super.key,
    this.width,
    this.height,
    required this.url,
    this.fit,
    this.fromLocal = false,
    this.fromMemory = false,
    this.borderRadius = 0,
    this.bgColor, 
    this.text,
    this.file,
    this.alignment = Alignment.center,
    this.fadeInEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: fromMemory
          ? Image.file(
              File(file!),
              fit: fit,
              width: width,
              height: height,
            )
          : !fromLocal
              ? (url.isEmpty
                  ? Image.asset(
                      notFoundImage, // Replace with a valid placeholder asset in your project.
                      width: width,
                      height: height,
                      fit: fit,
                      alignment: alignment,
                    )
                  : Image.network(
                      url,
                      width: width,
                      height: height,
                      fit: fit,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          notFoundImage,
                          width: width,
                          height: height,
                          fit: fit,
                          alignment: alignment,
                        );
                      },
                    ))
              : Image.asset(
                  url,
                  fit: fit,
                  width: width,
                  height: height,
                  alignment: alignment,
                ),
      ),
    );
  }
}
