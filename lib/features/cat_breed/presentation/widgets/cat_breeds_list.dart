import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breeds_bloc.dart';
import 'package:cat_breeds/features/cat_breed/presentation/widgets/cat_breed_card.dart';
import 'package:cat_breeds/features/common/presentation/widgets/empty_view.dart';
import 'package:cat_breeds/features/common/presentation/widgets/error_view.dart';
import 'package:cat_breeds/features/common/presentation/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsList extends StatefulWidget {
  const CatBreedsList({super.key});

  @override
  State<CatBreedsList> createState() => _CatBreedsListState();
}

class _CatBreedsListState extends State<CatBreedsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      BlocProvider.of<CatBreedsBloc>(context, listen: false).add(StartGetCatBreeds());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedsBloc, CatBreedsState>(
      builder: (context, catBreedsState){
        return catBreedsState.catBreedsListLoading ? 
        const LoadingView(
          heigth: 60
        ) :
        catBreedsState.catBreedsListError ? const ErrorView(
          heigth: 60
        ) : catBreedsState.catBreedsList.isEmpty ? const EmptyView(
          heigth: 60
        ) :  Column(
          children: catBreedsState.catBreedsList.map((e) => CatBreedCard(
            catBreedEntity: e
          )).toList()
        );
      }, 
    );
  }
}