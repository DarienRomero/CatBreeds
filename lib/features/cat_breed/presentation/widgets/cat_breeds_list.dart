import 'package:cat_breeds/core/constants.dart';
import 'package:cat_breeds/core/utils.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breeds_list/cat_breeds_list_bloc.dart';
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
        BlocProvider.of<CatBreedsListBloc>(context, listen: false).add(StartGetCatBreeds());
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_){
      BlocProvider.of<CatBreedsListBloc>(context, listen: false).add(StartGetCatBreeds(
        reset: true
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedsListBloc, CatBreedsListState>(
      builder: (context, catBreedsState){
        return catBreedsState.catBreedsListLoading && catBreedsState.catBreedsList.isEmpty? 
        const LoadingView(
          heigth: 80
        ) : catBreedsState.catBreedsListError ? const ErrorView(
          heigth: 80
        ) : catBreedsState.catBreedsList.isEmpty ? const EmptyView(
          heigth: 80
        ) : Stack(
          children: [
            SizedBox(
              height: mqHeigth(context, 80),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: mqWidth(context, 5)
                ),
                controller: scrollController,
                itemCount: catBreedsState.catBreedsList.length,
                separatorBuilder: (context, index) => const VSpacing(2),
                itemBuilder: (context, index) {
                  final item = catBreedsState.catBreedsList[index];
                  return CatBreedCard(
                    catBreedEntity: item
                  );
                },
              ),
            ),
            if(catBreedsState.catBreedsListLoading && catBreedsState.catBreedsList.isNotEmpty)
              Positioned(
                bottom: mqHeigth(context, 2),
                left: 0,
                right: 0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              )
          ],
        );
      }, 
    );
  }
}