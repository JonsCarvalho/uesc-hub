// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsController on _NewsControllerBase, Store {
  final _$newsAtom = Atom(name: '_NewsControllerBase.news');

  @override
  ObservableFuture<List<NewsModel>> get news {
    _$newsAtom.context.enforceReadPolicy(_$newsAtom);
    _$newsAtom.reportObserved();
    return super.news;
  }

  @override
  set news(ObservableFuture<List<NewsModel>> value) {
    _$newsAtom.context.conditionallyRunInAction(() {
      super.news = value;
      _$newsAtom.reportChanged();
    }, _$newsAtom, name: '${_$newsAtom.name}_set');
  }

  final _$_NewsControllerBaseActionController =
      ActionController(name: '_NewsControllerBase');

  @override
  dynamic fetchNews() {
    final _$actionInfo = _$_NewsControllerBaseActionController.startAction();
    try {
      return super.fetchNews();
    } finally {
      _$_NewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'news: ${news.toString()}';
    return '{$string}';
  }
}
