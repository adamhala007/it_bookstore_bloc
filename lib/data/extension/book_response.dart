import 'package:it_bookstore_bloc/data/extension/general.dart';

import '../constant/constant.dart';
import '../model/book.dart';
import '../response/responses.dart';

extension BookResponseExtension on BookResponse? {
  Book toDomain() {
    return Book(
        this?.error?.orEmpty() ?? Constant.emptyString,
        this?.title?.orEmpty() ?? Constant.emptyString,
        this?.subtitle?.orEmpty() ?? Constant.emptyString,
        this?.authors?.orEmpty() ?? Constant.emptyString,
        this?.publisher?.orEmpty() ?? Constant.emptyString,
        this?.isbn10?.orEmpty() ?? Constant.emptyString,
        this?.isbn13?.orEmpty() ?? Constant.emptyString,
        this?.pages?.orEmpty() ?? Constant.emptyString,
        this?.year?.orEmpty() ?? Constant.emptyString,
        this?.rating?.orEmpty() ?? Constant.emptyString,
        this?.desc?.orEmpty() ?? Constant.emptyString,
        this?.price?.orEmpty() ?? Constant.emptyString,
        this?.image?.orEmpty() ?? Constant.emptyString,
        this?.url?.orEmpty() ?? Constant.emptyString,
        this?.pdf ?? Constant.emptyMap);
  }
}
