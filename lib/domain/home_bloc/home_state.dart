part of 'home_bloc.dart';

enum HomeStatus {
  initial(),
  success(),
  failure(),
  searchSucess(),
  loadingMoreBreeds(),
  loadingSearch();

  bool get isInitial => this == HomeStatus.initial;
  bool get isLoadingMoreBreeds => this == HomeStatus.loadingMoreBreeds;
  bool get isLoadingSearch => this == HomeStatus.loadingSearch;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
  bool get isSearchSuccess => this == HomeStatus.searchSucess;
}

class HomeState extends Equatable {
  const HomeState({
    required this.appError,
    required this.catBreeds,
    required this.fetchLimit,
    this.status = HomeStatus.initial,
  });

  HomeState.initial()
      : this(
          status: HomeStatus.initial,
          appError: AppError.empty(),
          catBreeds: [],
          fetchLimit: 10,
        );

  final HomeStatus status;
  final List<CatBreedEntity> catBreeds;
  final AppError appError;
  final int fetchLimit;

  @override
  List<Object> get props => [
        status,
        appError,
      ];

  HomeState copyWith({
    HomeStatus? status,
    AppError? appError,
    List<CatBreedEntity>? catBreeds,
    int? fetchLimit,
  }) =>
      HomeState(
        status: status ?? this.status,
        appError: appError ?? this.appError,
        catBreeds: catBreeds ?? this.catBreeds,
        fetchLimit: fetchLimit ?? this.fetchLimit,
      );
}
