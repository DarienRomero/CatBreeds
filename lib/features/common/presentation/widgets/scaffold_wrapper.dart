import 'package:flutter/material.dart';

/// A customizable wrapper around the Flutter `Scaffold` widget.
///
/// This widget provides additional functionality and customization, such as:
/// - Restricting the text scale factor to improve accessibility consistency.
/// - Adding a `WillPopScope` to handle back navigation.
/// - Extending the functionality of the `Scaffold` with extra parameters.
///
/// Example usage:
/// ```dart
/// ScaffoldWrapper(
///   appBar: AppBar(title: Text("Example")),
///   body: Center(child: Text("Hello, World!")),
///   floatingActionButton: FloatingActionButton(
///     onPressed: () {},
///     child: Icon(Icons.add),
///   ),
/// )
/// ```
class ScaffoldWrapper extends StatelessWidget {
  /// The app bar widget displayed at the top of the screen.
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold.
  final Widget? body;

  /// A floating action button displayed above the body.
  final Widget? floatingActionButton;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// A widget for the drawer navigation menu.
  final Widget? drawer;

  /// A widget displayed at the bottom of the scaffold, such as a navigation bar.
  final Widget? bottomNavigationBar;

  /// The location of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// The animator for the floating action button's motion.
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// A callback that is triggered when the back button is pressed.
  /// Returns a `Future<bool>` to indicate whether to allow navigation.
  final Future<bool> Function()? onWillPop;

  /// A key for uniquely identifying this scaffold.
  final Key? scaffoldKey;

  /// Whether the scaffold should resize its body when the keyboard appears.
  final bool? resizeToAvoidBottomInset;

  /// A callback triggered when the drawer state changes (opened or closed).
  final Function(bool)? onDrawerChanged;

  /// Creates a customizable scaffold wrapper with extended functionality.
  const ScaffoldWrapper({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.backgroundColor,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.onWillPop,
    this.scaffoldKey,
    this.resizeToAvoidBottomInset,
    this.onDrawerChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Restrict the text scale factor to a range between 1.0 and 1.2.
    final bounded = MediaQuery.of(context).textScaleFactor.clamp(1.2, 1.2);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: bounded),
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          onDrawerChanged: onDrawerChanged,
          extendBody: true,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          key: scaffoldKey,
          drawer: drawer,
          appBar: appBar,
          body: body,
          backgroundColor: backgroundColor,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
        ),
      ),
    );
  }
}
