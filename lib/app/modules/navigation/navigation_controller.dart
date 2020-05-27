import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';
import 'models/pavilion_model.dart';

part 'navigation_controller.g.dart';

class NavigationController = _NavigationControllerBase
    with _$NavigationController;

abstract class _NavigationControllerBase with Store {
  Completer<GoogleMapController> mapsController = Completer();

  @observable
  BitmapDescriptor pinLocationIcon;

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

  @observable
  ObservableList<Marker> allMarkers = <Marker>[].asObservable();

  @observable
  PageController pageController;

  @observable
  int prevPage;

  _NavigationControllerBase() {
    init();
  }

  @action
  init() async {
    pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(onScroll);

    cameraZoom = 17;
    cameraTilt = 30;
    cameraBearing = 0;
    sourceLocation = LatLng(-14.797483, -39.172245);
    mapStyleSelected = 'light';
    setMapStyle();
    setCustomMapPin();
  }

  @action
  initMarkers() async {
    pavilionList.forEach(
      (element) async {
        allMarkers.add(
          Marker(
            markerId: MarkerId(element.name),
            draggable: false,
            infoWindow:
                InfoWindow(title: element.name, snippet: element.address),
            position: element.locationCoords,
            icon: await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(devicePixelRatio: 2.5, size: Size(.2, .2)),
                'assets/maps/markers/pin03_small.png'),
          ),
        );
      },
    );
  }

  @action
  setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/maps/markers/pin05.png');
  }

  @action
  onScroll() {
    if (pageController.page.toInt() != prevPage) {
      prevPage = pageController.page.toInt();
      moveCamera();
    }
  }

  moveCamera() async {
    final GoogleMapController controller = await mapsController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: pavilionList[pageController.page.toInt()].locationCoords,
          zoom: 18.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
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
