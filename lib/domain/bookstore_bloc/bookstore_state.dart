import 'package:equatable/equatable.dart';
import 'package:it_bookstore_bloc/data/model/bookstore.dart';

class BookstoreState extends Equatable {
  const BookstoreState();

  @override
  List<Object?> get props => [];
}

class BookstoreIsNotSearched extends BookstoreState {}

class BookstoreIsLoading extends BookstoreState {}

class BookstoreIsLoaded extends BookstoreState {
  final dynamic bookstore;

  const BookstoreIsLoaded(this.bookstore);

  BookStore get getBookstore => bookstore;

  @override
  List<Object?> get props => [bookstore];
}

class BookstoreFailure extends BookstoreState {}
