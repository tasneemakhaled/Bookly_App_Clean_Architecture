import 'package:bookly_app_clean_architecture/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_clean_architecture/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_clean_architecture/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_clean_architecture/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>( ApiService(dio: Dio()
              ),);
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
            homeRemoteDataSource:
             HomeRemoteDataSourceImpl(
              apiService: getIt.get<ApiService>()
              ), homeLocalDataSource: HomeLocalDataSourceimpl()),
        );
}