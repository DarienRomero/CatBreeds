import 'package:cat_breeds/features/cat_breed/data/datasources/remote/cat_breeds_remote_datasource.dart';
import 'package:cat_breeds/features/cat_breed/data/datasources/remote/cat_breeds_remote_datasource_impl.dart';
import 'package:cat_breeds/features/cat_breed/data/repositories/cat_breeds_repository_impl.dart';
import 'package:cat_breeds/features/cat_breed/domain/repositories/cat_breeds_repository.dart';
import 'package:cat_breeds/features/cat_breed/domain/usecases/get_cat_breeds_usecase.dart';
import 'package:cat_breeds/features/cat_breed/presentation/bloc/cat_breeds_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> initializeServiceLocator() async {

  serviceLocator.registerLazySingleton(() => http.Client());
  //ACTIVITIES_BLOC

  serviceLocator.registerLazySingleton(() => GetCatBreedsUseCase(serviceLocator()));

  serviceLocator.registerFactory(
    () => CatBreedsBloc(
      getCatBreedsUseCase: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<CatBreedsRepository>(
    () => CatBreedsRepositoryImpl(
      catBreedsRemoteRepositoryDataSource: serviceLocator(),
    ),
  );

  //* data sources
  serviceLocator.registerLazySingleton<CatBreedsRemoteRepositoryDataSource>(
    () => CatBreedsRemoteRepositoryDataSourceImpl(
      client: serviceLocator(),
    ),
  );
}