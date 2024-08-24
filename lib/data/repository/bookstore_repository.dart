import 'package:dartz/dartz.dart';
import 'package:it_bookstore_bloc/data/data_source/remote_bookstore_datasource.dart';
import 'package:it_bookstore_bloc/data/extension/book_response.dart';
import 'package:it_bookstore_bloc/data/extension/bookstore_response.dart';

import '../model/book.dart';
import '../model/bookstore.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';

class BookstoreRepository {
  RemoteBookstoreDatasource remoteDataSource;

  BookstoreRepository(this.remoteDataSource);

  Future<Either<Failure, Book>> getBookDetail(String isbn13) async {
    try {
      final response = await remoteDataSource.getBookDetail(isbn13);
      return Right(response.toDomain());
    } catch (error) {
      return Left(
          Failure(ResponseCode.loadDataFailed, ResponseMessage.loadDataFailed));
    }
  }

  Future<Either<Failure, BookStore>> paginatedSearch(
      String query, int page) async {
    try {
      final response = await remoteDataSource.paginatedSearch(query, page);
      return Right(response.toDomain());
    } catch (error) {
      return Left(
          Failure(ResponseCode.loadDataFailed, ResponseMessage.loadDataFailed));
    }
  }

  Future<Either<Failure, BookStore>> search(String query) async {
    try {
      final response = await remoteDataSource.search(query);
      return Right(response.toDomain());
    } catch (error) {
      return Left(
          Failure(ResponseCode.loadDataFailed, ResponseMessage.loadDataFailed));
    }
  }

  Future<Either<Failure, BookStore>> searchNewReleases() async {
    try {
      final response = await remoteDataSource.searchNewReleases();
      return Right(response.toDomain());
    } catch (error) {
      return Left(
          Failure(ResponseCode.loadDataFailed, ResponseMessage.loadDataFailed));
    }
  }
}
