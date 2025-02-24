import 'package:cat_breeds/core/navigation.dart';
import 'package:cat_breeds/core/utils.dart';
import 'package:cat_breeds/features/cat_breed/presentation/pages/cat_breeds_home_page.dart';
import 'package:cat_breeds/features/common/presentation/widgets/general_image.dart';
import 'package:cat_breeds/features/common/presentation/widgets/v_spacing.dart';
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
      Future.delayed(const Duration(milliseconds: 2000), (){
        if(mounted){
          Navigator.pushAndRemoveUntil(context, materialNavigationRoute(context, const CatsHomePage()), (route) => false);
        }
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cat Breeds", style: Theme.of(context).textTheme.displayLarge),
          const VSpacing(2),
          GeneralImage(
            width: mqWidth(context, 30),
            url: "https://wallpapers.com/images/hd/funny-cat-memes-pictures-refm2dzuyg0vv9qq.jpg"
          )
        ],
      )
    );
  }
}