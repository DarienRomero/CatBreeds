import 'package:flutter/material.dart';

class DetailContentList extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  const DetailContentList({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverList(
        delegate: SliverChildListDelegate(children),
      ),
    );
  }
}
