import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:it_bookstore_bloc/presentation/resources/strings_manager.dart';
import 'package:it_bookstore_bloc/presentation/resources/values_manager.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.itBookstoreTitle.tr(),
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s20),
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
              Expanded(child: ListView()),
              const Text('Paginator placeholder'),
            ],
          ),
        ),
      ),
    );
  }
}
