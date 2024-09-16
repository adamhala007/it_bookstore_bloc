import 'package:bloc/bloc.dart';
import 'package:it_bookstore_bloc/data/repository/bookstore_repository.dart';

import 'book_detail_state.dart';
import 'bookdetail_event.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final BookstoreRepository bookstoreRepository;

  BookDetailBloc(this.bookstoreRepository) : super(BookDetailIsNotSearched()) {
    on<FetchBookDetail>(_onFetchBookDetail);
  }

  Future<void> _onFetchBookDetail(
      FetchBookDetail event, Emitter<BookDetailState> emit) async {
    emit(BookDetailIsLoading());
    if (event.isbn13 == null || event.isbn13!.isEmpty) {
      emit(BookDetailFailure());
      return;
    }

    final result = await bookstoreRepository.getBookDetail(event.isbn13!);
    result.fold((failure) => emit(BookDetailFailure()),
        (bookDetail) => emit(BookDetailIsLoaded(bookDetail)));
  }
}
