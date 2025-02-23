import 'package:cat_breeds/core/constants.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breeds_bloc.dart';
import 'package:cat_breeds/features/cat_breed/presentation/widgets/cat_breed_card.dart';
import 'package:cat_breeds/features/common/presentation/widgets/empty_view.dart';
import 'package:cat_breeds/features/common/presentation/widgets/error_view.dart';
import 'package:cat_breeds/features/common/presentation/widgets/loading_view.dart';
import 'package:cat_breeds/features/common/presentation/widgets/v_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsList extends StatefulWidget {
  const CatBreedsList({super.key});

  @override
  State<CatBreedsList> createState() => _CatBreedsListState();
}

class _CatBreedsListState extends State<CatBreedsList> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener( () {
      if(scrollController.offset >= scrollController.position.maxScrollExtent - scrollThreshold){
        BlocProvider.of<CatBreedsBloc>(context, listen: false).add(StartGetCatBreeds());
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_){
      BlocProvider.of<CatBreedsBloc>(context, listen: false).add(StartGetCatBreeds(
        reset: true
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedsBloc, CatBreedsState>(
      builder: (context, catBreedsState){
        return catBreedsState.catBreedsListLoading ? 
        const LoadingView(
          heigth: 60
        ) : catBreedsState.catBreedsListError ? const ErrorView(
          heigth: 60
        ) : catBreedsState.catBreedsList.isEmpty ? const EmptyView(
          heigth: 60
        ) : ListView.separated(
          controller: scrollController,
          itemCount: catBreedsState.catBreedsList.length,
          separatorBuilder: (context, index) => const VSpacing(2),
          itemBuilder: (context, index) {
            final item = catBreedsState.catBreedsList[index];
            return CatBreedCard(
              catBreedEntity: item
            );
          },
        );
      }, 
    );
  }
}