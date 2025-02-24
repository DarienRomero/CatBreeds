import 'package:cat_breeds/core/utils.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breed_detail/cat_breed_detail_bloc.dart';
import 'package:cat_breeds/features/common/presentation/widgets/general_image.dart';
import 'package:cat_breeds/features/common/presentation/widgets/scaffold_wrapper.dart';
import 'package:cat_breeds/features/common/presentation/widgets/v_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedDetailPage extends StatelessWidget {
  final CatBreedEntity catBreedEntity;
  const CatBreedDetailPage({
    super.key,
    required this.catBreedEntity
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(catBreedEntity.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: mqWidth(context, 5)
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: catBreedEntity.id,
                    child: GeneralImage(
                      url: catBreedEntity.imageUrl,
                      width: mqWidth(context, 90),
                      height: mqHeigth(context, 30),
                      borderRadius: 10,
                      fromLocal: false,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const VSpacing(2),
                  Text(catBreedEntity.name, style: Theme.of(context).textTheme.displayLarge),
                  const VSpacing(2),
                  Text(catBreedEntity.description, style: Theme.of(context).textTheme.displaySmall),
                  const VSpacing(2),
                  Text("Origin country: ${catBreedEntity.origin}", style: Theme.of(context).textTheme.displayMedium),
                  const VSpacing(1),
                  Text("Intelligence: ${catBreedEntity.intelligence}", style: Theme.of(context).textTheme.displayMedium),
                  BlocBuilder<CatBreedDetailBloc, CatBreedDetailState>(
                    builder: (context, catBreedsState){
                      if(catBreedsState.catBreedError || catBreedsState.catBreedLoading) return Container();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VSpacing(1),
                          Text("Weight: ${catBreedsState.catBreed.weight.metric} kg", style: Theme.of(context).textTheme.displayMedium),
                        ],
                      );
                    }
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}