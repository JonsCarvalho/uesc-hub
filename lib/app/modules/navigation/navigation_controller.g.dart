// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationController on _NavigationControllerBase, Store {
  final _$cameraZoomAtom = Atom(name: '_NavigationControllerBase.cameraZoom');

  @override
  double get cameraZoom {
    _$cameraZoomAtom.context.enforceReadPolicy(_$cameraZoomAtom);
    _$cameraZoomAtom.reportObserved();
    return super.cameraZoom;
  }

  @override
  set cameraZoom(double value) {
    _$cameraZoomAtom.context.conditionallyRunInAction(() {
      super.cameraZoom = value;
      _$cameraZoomAtom.reportChanged();
    }, _$cameraZoomAtom, name: '${_$cameraZoomAtom.name}_set');
  }

  final _$cameraTiltAtom = Atom(name: '_NavigationControllerBase.cameraTilt');

  @override
  double get cameraTilt {
    _$cameraTiltAtom.context.enforceReadPolicy(_$cameraTiltAtom);
    _$cameraTiltAtom.reportObserved();
    return super.cameraTilt;
  }

  @override
  set cameraTilt(double value) {
    _$cameraTiltAtom.context.conditionallyRunInAction(() {
      super.cameraTilt = value;
      _$cameraTiltAtom.reportChanged();
    }, _$cameraTiltAtom, name: '${_$cameraTiltAtom.name}_set');
  }

  final _$cameraBearingAtom =
      Atom(name: '_NavigationControllerBase.cameraBearing');

  @override
  double get cameraBearing {
    _$cameraBearingAtom.context.enforceReadPolicy(_$cameraBearingAtom);
    _$cameraBearingAtom.reportObserved();
    return super.cameraBearing;
  }

  @override
  set cameraBearing(double value) {
    _$cameraBearingAtom.context.conditionallyRunInAction(() {
      super.cameraBearing = value;
      _$cameraBearingAtom.reportChanged();
    }, _$cameraBearingAtom, name: '${_$cameraBearingAtom.name}_set');
  }

  final _$sourceLocationAtom =
      Atom(name: '_NavigationControllerBase.sourceLocation');

  @override
  LatLng get sourceLocation {
    _$sourceLocationAtom.context.enforceReadPolicy(_$sourceLocationAtom);
    _$sourceLocationAtom.reportObserved();
    return super.sourceLocation;
  }

  @override
  set sourceLocation(LatLng value) {
    _$sourceLocationAtom.context.conditionallyRunInAction(() {
      super.sourceLocation = value;
      _$sourceLocationAtom.reportChanged();
    }, _$sourceLocationAtom, name: '${_$sourceLocationAtom.name}_set');
  }

  final _$destLocationAtom =
      Atom(name: '_NavigationControllerBase.destLocation');

  @override
  LatLng get destLocation {
    _$destLocationAtom.context.enforceReadPolicy(_$destLocationAtom);
    _$destLocationAtom.reportObserved();
    return super.destLocation;
  }

  @override
  set destLocation(LatLng value) {
    _$destLocationAtom.context.conditionallyRunInAction(() {
      super.destLocation = value;
      _$destLocationAtom.reportChanged();
    }, _$destLocationAtom, name: '${_$destLocationAtom.name}_set');
  }

  final _$mapStyleSelectedAtom =
      Atom(name: '_NavigationControllerBase.mapStyleSelected');

  @override
  String get mapStyleSelected {
    _$mapStyleSelectedAtom.context.enforceReadPolicy(_$mapStyleSelectedAtom);
    _$mapStyleSelectedAtom.reportObserved();
    return super.mapStyleSelected;
  }

  @override
  set mapStyleSelected(String value) {
    _$mapStyleSelectedAtom.context.conditionallyRunInAction(() {
      super.mapStyleSelected = value;
      _$mapStyleSelectedAtom.reportChanged();
    }, _$mapStyleSelectedAtom, name: '${_$mapStyleSelectedAtom.name}_set');
  }

  final _$mapStyleAtom = Atom(name: '_NavigationControllerBase.mapStyle');

  @override
  String get mapStyle {
    _$mapStyleAtom.context.enforceReadPolicy(_$mapStyleAtom);
    _$mapStyleAtom.reportObserved();
    return super.mapStyle;
  }

  @override
  set mapStyle(String value) {
    _$mapStyleAtom.context.conditionallyRunInAction(() {
      super.mapStyle = value;
      _$mapStyleAtom.reportChanged();
    }, _$mapStyleAtom, name: '${_$mapStyleAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$setMapStyleAsyncAction = AsyncAction('setMapStyle');

  @override
  Future setMapStyle() {
    return _$setMapStyleAsyncAction.run(() => super.setMapStyle());
  }

  final _$_NavigationControllerBaseActionController =
      ActionController(name: '_NavigationControllerBase');

  @override
  dynamic selectMapStyle(String style) {
    final _$actionInfo =
        _$_NavigationControllerBaseActionController.startAction();
    try {
      return super.selectMapStyle(style);
    } finally {
      _$_NavigationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cameraZoom: ${cameraZoom.toString()},cameraTilt: ${cameraTilt.toString()},cameraBearing: ${cameraBearing.toString()},sourceLocation: ${sourceLocation.toString()},destLocation: ${destLocation.toString()},mapStyleSelected: ${mapStyleSelected.toString()},mapStyle: ${mapStyle.toString()}';
    return '{$string}';
  }
}
