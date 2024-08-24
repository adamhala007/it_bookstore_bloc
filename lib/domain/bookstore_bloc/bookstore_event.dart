import 'package:equatable/equatable.dart';

class BookstoreEvent extends Equatable {
  const BookstoreEvent();

  @override
  List<Object> get props => [];
}

class FetchBookstore extends BookstoreEvent {
  final String query;
  final int page;

  const FetchBookstore(this.query, this.page);

  @override
  List<Object> get props => [query, page];
}

class ResetBookstore extends BookstoreEvent {}
