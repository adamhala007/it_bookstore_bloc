import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/model/book.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../router/app_router.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookDetailRoute,
            arguments: book.isbn13);
      },
      child: SizedBox(
        height: AppSize.s180,
        child: Card(
          child: Row(
            children: [
              Expanded(flex: 2, child: Image.network(book.image)),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.p8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          book.title,
                          style: getBoldStyle(color: Colors.black),
                        ),
                      ),
                      Text(
                        book.subtitle,
                        style: getItalicStyle(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            book.price,
                            style: getSemiBoldStyle(color: Colors.black),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: ColorManager.orange,
                              size: AppSize.s20,
                            ),
                            label: Text(
                              AppStrings.buy.tr(),
                              style: getMediumStyle(color: ColorManager.orange),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
