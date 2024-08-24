import 'book.dart';

class BookStore {
  int? maxPage;
  String? page;
  List<Book> books;

  BookStore(this.maxPage, this.page, this.books);

  @override
  String toString() {
    return 'BookStore{total: $maxPage, page: $page, books: $books}';
  }
}
