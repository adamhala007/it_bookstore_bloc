import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_bookstore_bloc/app/di.dart';
import 'package:it_bookstore_bloc/data/model/bookstore.dart';
import 'package:it_bookstore_bloc/domain/bookstore_bloc/bookstore_bloc.dart';
import 'package:it_bookstore_bloc/domain/bookstore_bloc/bookstore_event.dart';
import 'package:it_bookstore_bloc/domain/bookstore_bloc/bookstore_state.dart';
import 'package:it_bookstore_bloc/presentation/resources/strings_manager.dart';
import 'package:it_bookstore_bloc/presentation/resources/values_manager.dart';
import 'package:it_bookstore_bloc/presentation/widget/book_card.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class BookstoreView extends StatefulWidget {
  const BookstoreView({super.key});

  @override
  State<BookstoreView> createState() => _BookstoreViewState();
}

class _BookstoreViewState extends State<BookstoreView> {
  TextEditingController searchController = TextEditingController();
  BookstoreBloc bookstoreBloc = instance<BookstoreBloc>();

  @override
  void initState() {
    bookstoreBloc.add(const FetchBookstore('', 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<BookstoreBloc, BookstoreState>(
          bloc: bookstoreBloc,
          listener: (context, state) {
            if (state is BookstoreFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Something went wrong"),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is BookstoreIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BookstoreIsLoaded) {
              return buildBookstore(state.getBookstore);
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }

  Padding buildBookstore(BookStore bookstore) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.itBookstoreTitle.tr(),
            style:
                getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          TextFormField(
            controller: searchController,
            style: getRegularStyle(
                color: ColorManager.black, fontSize: FontSize.s13),
            decoration: InputDecoration(
              hintText: AppStrings.searchBy.tr(),
              suffixIcon: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: ColorManager.orange,
                  size: AppSize.s20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: bookstore.books.length,
                  itemBuilder: (context, index) {
                    return BookCard(book: bookstore.books[index]);
                  })),
          const Text('Paginator placeholder'),
        ],
      ),
    );
  }
}
