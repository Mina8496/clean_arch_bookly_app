import 'package:clean_arch_bookly_app/core/utils/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_local_data_sources.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:clean_arch_bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServicesLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSources: HomeRemoteDataSourcesImp(getIt.get<ApiService>()),
      homeLocalDataSources: HomeLocalDataSourcesImp(),
    ),
  );
}
