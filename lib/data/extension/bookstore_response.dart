import 'package:it_bookstore_bloc/data/extension/book_response.dart';
import 'package:it_bookstore_bloc/data/extension/general.dart';

import '../constant/constant.dart';
import '../model/book.dart';
import '../model/bookstore.dart';
import '../response/responses.dart';
import '../util/bookstore_util.dart';

extension BookStoreResponseExtension on BookStoreResponse? {
  BookStore toDomain() {
    return BookStore(
        BookStoreUtil.countMaxPage(this?.total),
        this?.page?.orEmpty() ?? Constant.emptyString,
        (this
                ?.books
                ?.map((bookResponse) => bookResponse.toDomain())
                .toList()) ??
            (Constant.emptyList as List<Book>));
  }
}
