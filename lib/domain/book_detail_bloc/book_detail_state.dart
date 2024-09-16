import 'package:equatable/equatable.dart';

import '../../data/model/book.dart';

class BookDetailState extends Equatable {
  const BookDetailState();

  @override
  List<Object?> get props => [];
}

class BookDetailIsNotSearched extends BookDetailState {}

class BookDetailIsLoading extends BookDetailState {}

class BookDetailIsLoaded extends BookDetailState {
  final dynamic bookDetail;

  const BookDetailIsLoaded(this.bookDetail);

  Book get getBookDetail => bookDetail;

  @override
  List<Object?> get props => [bookDetail];
}

class BookDetailFailure extends BookDetailState {}
