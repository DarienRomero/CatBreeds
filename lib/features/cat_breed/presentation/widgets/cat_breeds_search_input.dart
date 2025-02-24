import 'dart:async';

import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breeds_bloc.dart';
import 'package:cat_breeds/features/common/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsSearchInput extends StatefulWidget {
  const CatBreedsSearchInput({super.key});

  @override
  State<CatBreedsSearchInput> createState() => _CatBreedsSearchInputState();
}

class _CatBreedsSearchInputState extends State<CatBreedsSearchInput> {
  
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: "Search by breed...", 
      label: "",
      fillColor: Colors.white,
      onChanged: (value){
        timer?.cancel();
        timer = Timer(const Duration(milliseconds: 500), () {
          BlocProvider.of<CatBreedsBloc>(context, listen: false).add(StartGetCatBreeds(
            searchText: value,
            reset: true
          ));
        });
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}