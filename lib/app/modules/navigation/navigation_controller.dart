import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'navigation_controller.g.dart';

class NavigationController = _NavigationControllerBase
    with _$NavigationController;

abstract class _NavigationControllerBase with Store {
  @observable
  double cameraZoom;

  @observable
  double cameraTilt;

  @observable
  double cameraBearing;

  @observable
  LatLng sourceLocation;

  @observable
  LatLng destLocation;

  @observable
  String mapStyleSelected;

  @observable
  String mapStyle;

  _NavigationControllerBase() {
    init();
  }

  @action
  init() async {
    cameraZoom = 17;
    cameraTilt = 45;
    cameraBearing = 45;
    sourceLocation = LatLng(-14.797483, -39.172245);
    mapStyleSelected = 'light';
    await setMapStyle();
  }

  @action
  selectMapStyle(String style) {
    mapStyle = style;
  }

  @action
  setMapStyle() async {
    if (mapStyleSelected == 'light') {
      mapStyle = await rootBundle.loadString("assets/maps/styles/light.json");
    } else {
      mapStyle = await rootBundle.loadString("assets/maps/styles/dark.json");
    }
  }
}
