import 'package:bloc/bloc.dart';
import 'package:it_bookstore_bloc/data/repository/bookstore_repository.dart';
import 'package:it_bookstore_bloc/domain/bookstore_bloc/bookstore_event.dart';
import 'package:it_bookstore_bloc/domain/bookstore_bloc/bookstore_state.dart';

class BookstoreBloc extends Bloc<BookstoreEvent, BookstoreState> {
  final BookstoreRepository bookstoreRepository;

  BookstoreBloc(this.bookstoreRepository) : super(BookstoreIsNotSearched()) {
    on<FetchBookstore>(_onFetchBookstore);
  }

  Future<void> _onFetchBookstore(
      FetchBookstore event, Emitter<BookstoreState> emit) async {
    emit(BookstoreIsLoading());
    if (event.query.isEmpty) {
      final result = await bookstoreRepository.searchNewReleases();
      result.fold((failure) => emit(BookstoreFailure()),
          (bookstore) => emit(BookstoreIsLoaded(bookstore)));
      return;
    }
    final result =
        await bookstoreRepository.paginatedSearch(event.query, event.page);
    result.fold((failure) => emit(BookstoreFailure()),
        (bookstore) => emit(BookstoreIsLoaded(bookstore)));
  }
}
