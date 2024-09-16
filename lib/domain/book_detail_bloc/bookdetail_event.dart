import 'package:equatable/equatable.dart';

class BookDetailEvent extends Equatable {
  const BookDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchBookDetail extends BookDetailEvent {
  final String? isbn13;

  const FetchBookDetail(this.isbn13);

  @override
  List<Object> get props => [isbn13 ?? ''];
}

class ResetBookDetail extends BookDetailEvent {}
