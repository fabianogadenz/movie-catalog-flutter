// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieApiStore on _MovieApiStoreBase, Store {
  Computed<UpComing> _$upComingComputed;

  @override
  UpComing get upComing =>
      (_$upComingComputed ??= Computed<UpComing>(() => super.upComing,
              name: '_MovieApiStoreBase.upComing'))
          .value;
  Computed<PopularMovies> _$popularComputed;

  @override
  PopularMovies get popular =>
      (_$popularComputed ??= Computed<PopularMovies>(() => super.popular,
              name: '_MovieApiStoreBase.popular'))
          .value;
  Computed<MovieDetail> _$movieSelectedComputed;

  @override
  MovieDetail get movieSelected => (_$movieSelectedComputed ??=
          Computed<MovieDetail>(() => super.movieSelected,
              name: '_MovieApiStoreBase.movieSelected'))
      .value;

  final _$_upComingAtom = Atom(name: '_MovieApiStoreBase._upComing');

  @override
  UpComing get _upComing {
    _$_upComingAtom.reportRead();
    return super._upComing;
  }

  @override
  set _upComing(UpComing value) {
    _$_upComingAtom.reportWrite(value, super._upComing, () {
      super._upComing = value;
    });
  }

  final _$_popularAtom = Atom(name: '_MovieApiStoreBase._popular');

  @override
  PopularMovies get _popular {
    _$_popularAtom.reportRead();
    return super._popular;
  }

  @override
  set _popular(PopularMovies value) {
    _$_popularAtom.reportWrite(value, super._popular, () {
      super._popular = value;
    });
  }

  final _$_movieSelectedAtom = Atom(name: '_MovieApiStoreBase._movieSelected');

  @override
  MovieDetail get _movieSelected {
    _$_movieSelectedAtom.reportRead();
    return super._movieSelected;
  }

  @override
  set _movieSelected(MovieDetail value) {
    _$_movieSelectedAtom.reportWrite(value, super._movieSelected, () {
      super._movieSelected = value;
    });
  }

  final _$_MovieApiStoreBaseActionController =
      ActionController(name: '_MovieApiStoreBase');

  @override
  dynamic fetchUpcomingList() {
    final _$actionInfo = _$_MovieApiStoreBaseActionController.startAction(
        name: '_MovieApiStoreBase.fetchUpcomingList');
    try {
      return super.fetchUpcomingList();
    } finally {
      _$_MovieApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchPopularList() {
    final _$actionInfo = _$_MovieApiStoreBaseActionController.startAction(
        name: '_MovieApiStoreBase.fetchPopularList');
    try {
      return super.fetchPopularList();
    } finally {
      _$_MovieApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchMovie(int id) {
    final _$actionInfo = _$_MovieApiStoreBaseActionController.startAction(
        name: '_MovieApiStoreBase.fetchMovie');
    try {
      return super.fetchMovie(id);
    } finally {
      _$_MovieApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
upComing: ${upComing},
popular: ${popular},
movieSelected: ${movieSelected}
    ''';
  }
}
