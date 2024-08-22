import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:it_bookstore_bloc/presentation/resources/strings_manager.dart';
import 'package:it_bookstore_bloc/presentation/resources/values_manager.dart';

class BookstoreView extends StatefulWidget {
  const BookstoreView({super.key});

  @override
  State<BookstoreView> createState() => _BookstoreViewState();
}

class _BookstoreViewState extends State<BookstoreView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              Text(AppStrings.itBookstoreTitle.tr()),
            ],
          ),
        ),
      ),
    );
  }
}
