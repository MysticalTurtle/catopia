import 'package:catopia/domain/home_bloc/home_bloc.dart';
import 'package:catopia/ui/widgets/breed_card.dart';
import 'package:catopia/ui/widgets/searchbar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSuccessView extends StatefulWidget {
  const HomeSuccessView({super.key});

  @override
  State<HomeSuccessView> createState() => _HomeSuccessViewState();
}

class _HomeSuccessViewState extends State<HomeSuccessView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final status = context.read<HomeBloc>().state.status;
      if (status.isLoadingSearch || status.isSearchSuccess) return;

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<HomeBloc>().add(const LoadCatBreedsEv());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PopScope(
          onPopInvokedWithResult: (_, __) =>
          FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Catbreeds'),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: SearchBarApp(),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: state.catBreeds.isNotEmpty
                        ? ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.all(8),
                            itemCount: state.catBreeds.length + 1,
                            itemBuilder: (context, index) {
                              if (index == state.catBreeds.length) {
                                return state.status.isLoadingMoreBreeds
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : const SizedBox.shrink();
                              }
                              final catbreed = state.catBreeds[index];
                              return BreedCard(
                                catBreed: catbreed,
                              );
                            },
                          )
                        : Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/sad_cat.png',
                                  width: 200,
                                ),
                                const Text('No catbreeds found'),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
