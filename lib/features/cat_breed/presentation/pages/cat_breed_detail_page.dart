import 'package:cat_breeds/core/utils.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breed_detail/cat_breed_detail_bloc.dart';
import 'package:cat_breeds/features/common/presentation/widgets/detail_content_list.dart';
import 'package:cat_breeds/features/common/presentation/widgets/general_image.dart';
import 'package:cat_breeds/features/common/presentation/widgets/scaffold_wrapper.dart';
import 'package:cat_breeds/features/common/presentation/widgets/v_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedDetailPage extends StatelessWidget {
  final CatBreedEntity catBreedEntity;
  const CatBreedDetailPage({super.key, required this.catBreedEntity});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: mqHeigth(context, 30),
            expandedHeight: mqHeigth(context, 30),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(""),
              centerTitle: true,
              background: Hero(
                tag: catBreedEntity.id,
                child: GeneralImage(
                  url: catBreedEntity.imageUrl,
                  width: double.infinity,
                  height: mqHeigth(context, 30),
                  borderRadius: 0,
                  fromLocal: false,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          DetailContentList(
            padding: EdgeInsets.symmetric(horizontal: mqWidth(context, 5)),
            children: [
              const VSpacing(2),
              Text(catBreedEntity.name, style: Theme.of(context).textTheme.displayLarge),
              const VSpacing(2),
              Text(catBreedEntity.description, style: Theme.of(context).textTheme.displaySmall),
              const VSpacing(2),
              Text("Origin country: ${catBreedEntity.origin}", style: Theme.of(context).textTheme.displayMedium),
              const VSpacing(1),
              Text("Intelligence: ${catBreedEntity.intelligence} (5 means highest)", style: Theme.of(context).textTheme.displayMedium),
              BlocBuilder<CatBreedDetailBloc, CatBreedDetailState>(
                builder: (context, catBreedsState) {
                  if (catBreedsState.catBreedError || catBreedsState.catBreedLoading) return Container();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VSpacing(1),
                      Text("Life span: ${catBreedsState.catBreed.lifeSpan} years", style: Theme.of(context).textTheme.displayMedium),
                      const VSpacing(1),
                      Text("Adaptability: ${catBreedsState.catBreed.adaptability} (5 means highest)", style: Theme.of(context).textTheme.displayMedium),
                      const VSpacing(1),
                      Text("Weight: ${catBreedsState.catBreed.weight.metric} kg", style: Theme.of(context).textTheme.displayMedium),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
