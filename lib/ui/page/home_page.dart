import 'package:catopia/core/loading_page.dart';
import 'package:catopia/data/datasource/cat_datasource.dart';
import 'package:catopia/domain/home_bloc/home_bloc.dart';
import 'package:catopia/ui/page/home_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            datasource: CatDatasource(),
          )..add(InitEvent()),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state.status) {
            (HomeStatus.initial) => const LoadingPage(),
            (_) => const HomeSuccessView(),
          };
        },
      ),
    );
  }
}
