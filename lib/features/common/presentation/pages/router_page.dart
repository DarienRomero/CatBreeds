import 'package:cat_breeds/core/navigation.dart';
import 'package:cat_breeds/features/cat_breed/presentation/pages/cat_breeds_home_page.dart';
import 'package:flutter/material.dart';

/// A page that redirects to correct page on app inits.
class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(context, materialNavigationRoute(context, const CatsHomePage()), (route) => false);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}