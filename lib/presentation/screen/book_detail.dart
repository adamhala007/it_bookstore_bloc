import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_bookstore_bloc/domain/book_detail_bloc/book_detail_bloc.dart';
import 'package:it_bookstore_bloc/domain/book_detail_bloc/bookdetail_event.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/di.dart';
import '../../data/model/book.dart';
import '../../domain/book_detail_bloc/book_detail_state.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class BookDetailView extends StatefulWidget {
  BookDetailView({RouteSettings? routeSettings}) {
    if (routeSettings != null) {
      isbn13 = routeSettings.arguments as String?;
    }
  }
  String? isbn13;

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {
  BookDetailBloc bookDetailBloc = instance<BookDetailBloc>();

  @override
  void initState() {
    bookDetailBloc.add(FetchBookDetail(widget.isbn13));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<BookDetailBloc, BookDetailState>(
          bloc: bookDetailBloc,
          listener: (context, state) {
            if (state is BookDetailFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Something went wrong"),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is BookDetailIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BookDetailIsLoaded) {
              return buildBookDetail(state.getBookDetail);
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

  Widget buildBookDetail(Book book) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: AppSize.s190,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(book.image),
                              RatingBar.readOnly(
                                alignment: Alignment.center,
                                size: 15,
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                initialRating:
                                    double.tryParse(book.rating) ?? 0.0,
                                maxRating: 5,
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        book.title,
                                        style: getBoldStyle(
                                            color: Colors.black,
                                            fontSize: FontSize.s14),
                                      ),
                                      SizedBox(
                                        height: AppSize.s8,
                                      ),
                                      Text(
                                        book.authors,
                                        style: getSemiBoldStyle(
                                            color: ColorManager.darkGray),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              book.subtitle,
                              style: getItalicStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                  child: Divider(),
                ),
                Text(
                  AppStrings.description.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                SizedBox(
                  height: AppSize.s8,
                ),
                Text(
                  book.desc,
                  style: getItalicStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s13,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                  child: Divider(),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${AppStrings.publisher.tr()}:',
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s14),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        book.publisher,
                        style: getRegularStyle(
                            color: ColorManager.black, fontSize: FontSize.s13),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppPadding.p8,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${AppStrings.pages.tr()}:',
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s14),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        book.pages,
                        style: getRegularStyle(
                            color: ColorManager.black, fontSize: FontSize.s13),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppPadding.p8,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${AppStrings.year.tr()}:',
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s14),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${book.year}',
                        style: getRegularStyle(
                            color: ColorManager.black, fontSize: FontSize.s13),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppPadding.p8,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'ISBN:',
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s14),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        book.isbn13,
                        style: getRegularStyle(
                            color: ColorManager.black, fontSize: FontSize.s13),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppSize.s16,
                ),
                Divider(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${book.price}',
                              style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s16,
                              ),
                            ),
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart,
                                color: ColorManager.orange,
                                size: AppSize.s20,
                              ),
                              label: Text(
                                AppStrings.buy.tr(),
                                style: getMediumStyle(
                                  color: ColorManager.orange,
                                  fontSize: FontSize.s16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: AppSize.s16,
                ),
                _getPdfSection(book.pdf),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getPdfSection(Map<String, String> pdf) {
    if (pdf.isEmpty) {
      return Container();
    }
    List<Widget> widgets = [];
    widgets.add(
      Text(
        AppStrings.preview.tr(),
        style:
            getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s14),
      ),
    );

    for (String key in pdf.keys) {
      widgets.add(
        TextButton(
          onPressed: () async {
            var uri = Uri.parse('${pdf[key]}');
            if (await canLaunchUrl(uri)) {
              await launchUrl(
                uri,
                mode: LaunchMode.externalApplication,
              );
            } else {
              throw 'Could not launch $uri';
            }
          },
          child: Text(
            key,
            style: getBoldStyle(color: ColorManager.orange),
          ),
        ),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: widgets,
      ),
    );
  }
}
