import 'package:cat_breeds/features/cat_breed/presentation/widgets/cat_breeds_list.dart';
import 'package:cat_breeds/features/common/presentation/widgets/custom_text_field.dart';
import 'package:cat_breeds/features/common/presentation/widgets/scaffold_wrapper.dart';
import 'package:cat_breeds/features/common/presentation/widgets/v_spacing.dart';
import 'package:flutter/material.dart';

class CatsHomePage extends StatelessWidget {
  const CatsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text("Cat Breeds"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hintText: "Search by breed...", 
              label: ""
            ),
            VSpacing(2),
            CatBreedsList()
          ],
        ),
      ),
    );
  }
}