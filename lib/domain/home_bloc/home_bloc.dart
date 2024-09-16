import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:catopia/core/app_error.dart';
import 'package:catopia/data/datasource/cat_datasource.dart';
import 'package:catopia/domain/entities/cat_breed_entity.dart';
import 'package:catopia/domain/mapper/cat_breed_mapper.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

typedef HomeStateEmitter = Emitter<HomeState>;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CatDatasourceI datasource,
  })  : _datasource = datasource,
        super(HomeState.initial()) {
    on<InitEvent>(_onInitEv);
    on<LoadCatBreedsEv>(_onLoadCatBreedsEv);
    on<SearchCatBreedEv>(_onSearchCatBreedEv);
  }

  final CatDatasourceI _datasource;

  FutureOr<void> _onInitEv(
    InitEvent ev,
    HomeStateEmitter emit,
  ) async {

    final (response, error) = await _datasource.getCatBreeds(10, 0);

    if (error != null) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          appError: AppError(
            title: error.title,
            message: error.message,
            statusCode: error.statusCode,
          ),
        ),
      );
      return;
    }

    final listCatBreeds = response.map(CatBreedMapper.toEntity).toList();

    emit(
      state.copyWith(
        status: HomeStatus.success,
        catBreeds: listCatBreeds,
      ),
    );
  }

  FutureOr<void> _onLoadCatBreedsEv(
    LoadCatBreedsEv ev,
    HomeStateEmitter emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loadingMoreBreeds,
      ),
    );
    final page = state.catBreeds.length ~/ state.fetchLimit;
    final (response, error) =
        await _datasource.getCatBreeds(state.fetchLimit, page);

    if (error != null) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          appError: AppError(
            title: error.title,
            message: error.message,
            statusCode: error.statusCode,
          ),
        ),
      );
      return;
    }

    final listCatBreeds = response.map(CatBreedMapper.toEntity).toList();

    emit(
      state.copyWith(
        status: HomeStatus.success,
        catBreeds: state.catBreeds + listCatBreeds,
      ),
    );
  }

  FutureOr<void> _onSearchCatBreedEv(
    SearchCatBreedEv ev,
    HomeStateEmitter emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loadingSearch,
      ),
    );

    final (response, error) = await _datasource.searchCatBreed(ev.query);

    if (error != null) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          appError: AppError(
            title: error.title,
            message: error.message,
            statusCode: error.statusCode,
          ),
        ),
      );
      return;
    }

    final listCatBreeds = response.map(CatBreedMapper.toEntity).toList();

    emit(
      state.copyWith(
        status: HomeStatus.searchSucess,
        catBreeds: listCatBreeds,
      ),
    );
  }
}
