import 'package:cat_breeds/core/navigation.dart';
import 'package:cat_breeds/core/utils.dart';
import 'package:cat_breeds/features/cat_breed/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breeds_bloc.dart';
import 'package:cat_breeds/features/cat_breed/presentation/pages/cat_breed_detail_page.dart';
import 'package:cat_breeds/features/common/presentation/widgets/custom_button.dart';
import 'package:cat_breeds/features/common/presentation/widgets/general_image.dart';
import 'package:cat_breeds/features/common/presentation/widgets/v_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedCard extends StatelessWidget {
  final CatBreedEntity catBreedEntity;
  
  const CatBreedCard({
    super.key,
    required this.catBreedEntity
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        searchAndNavigate(context, catBreedEntity);
      },
      child: Container(
        width: mqWidth(context, 90),
        padding: EdgeInsets.symmetric(
          horizontal: mqWidth(context, 2.5),
          vertical: mqHeigth(context, 2)
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: catBreedEntity.id,
                  child: GeneralImage(
                    url: catBreedEntity.imageUrl,
                    width: mqWidth(context, 85),
                    height: mqHeigth(context, 20),
                    borderRadius: 10,
                    fromLocal: false,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: mqWidth(context, 3),
                  top: mqWidth(context, 3),
                  child: CustomButton(
                    onPressed: (){
                      searchAndNavigate(context, catBreedEntity);
                    },
                    buttonText: 'View more', 
                    heigth: 30,
                    labelColor: Colors.white,
                    borderRadius: 30,
                    width: mqWidth(context, 30), 
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const VSpacing(2),
            Text(catBreedEntity.name, style: Theme.of(context).textTheme.displayLarge),
            const VSpacing(2),
            Text("Origin country: ${catBreedEntity.origin}", style: Theme.of(context).textTheme.displayMedium),
            const VSpacing(1),
            Text("Intelligence: ${catBreedEntity.intelligence}", style: Theme.of(context).textTheme.displayMedium),
          ],
        ),
      ),
    );
  }
  void searchAndNavigate(BuildContext context, CatBreedEntity catBreedEntity){
    BlocProvider.of<CatBreedsBloc>(context, listen: false).add(StartGetCatBreed(
      catBreedId: catBreedEntity.id
    ));
    Navigator.push(context, cupertinoNavigationRoute(context, CatBreedDetailPage(
      catBreedEntity: catBreedEntity
    )));
  }
}