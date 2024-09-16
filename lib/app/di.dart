import 'package:get_it/get_it.dart';
import 'package:it_bookstore_bloc/domain/bookstore_bloc/bookstore_bloc.dart';

import '../data/data_source/remote_bookstore_datasource.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/repository/bookstore_repository.dart';
import '../domain/book_detail_bloc/book_detail_bloc.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteBookstoreDatasource>(
      () => RemoteBookstoreDatasource(instance()));

  instance.registerLazySingleton<BookstoreRepository>(
      () => BookstoreRepository(instance()));
}

Future<void> initBookStoreModule() async {
  if (!GetIt.I.isRegistered<BookstoreBloc>()) {
    instance.registerFactory<BookstoreBloc>(() => BookstoreBloc(instance()));
  }
}

Future<void> initBookDetailModule() async {
  if (!GetIt.I.isRegistered<BookDetailBloc>()) {
    instance.registerFactory<BookDetailBloc>(() => BookDetailBloc(instance()));
  }
}
