// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieApiStore on _MovieApiStoreBase, Store {
  final _$upComingAtom = Atom(name: '_MovieApiStoreBase.upComing');

  @override
  UpComing get upComing {
    _$upComingAtom.reportRead();
    return super.upComing;
  }

  @override
  set upComing(UpComing value) {
    _$upComingAtom.reportWrite(value, super.upComing, () {
      super.upComing = value;
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
  String toString() {
    return '''
upComing: ${upComing}
    ''';
  }
}
