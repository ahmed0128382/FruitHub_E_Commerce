import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/repos/products_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/app_bar_widget.dart';

import 'package:fruit_hub/features/main/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  int currentViewIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      currentViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductsRepo>(),
      ),
      child: Scaffold(
        appBar: appBarWidget(
          context,
          title: 'المنتجات',
          showBackArrow: false,
        ),
        // bottomNavigationBar: CustomButtonNavigationBar(
        //   currentIndex: currentViewIndex,
        //   onTap: onTabSelected,
        // ),
        body: ProductsViewBody(),
      ),
    );
  }
}
