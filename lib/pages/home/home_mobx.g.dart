// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeMobx on _HomeMobx, Store {
  final _$dataSourceAtom = Atom(name: '_HomeMobx.dataSource');

  @override
  List<dynamic> get dataSource {
    _$dataSourceAtom.reportRead();
    return super.dataSource;
  }

  @override
  set dataSource(List<dynamic> value) {
    _$dataSourceAtom.reportWrite(value, super.dataSource, () {
      super.dataSource = value;
    });
  }

  @override
  String toString() {
    return '''
dataSource: ${dataSource}
    ''';
  }
}
