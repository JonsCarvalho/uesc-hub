import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'models/pavilion_model.dart';
import 'navigation_controller.dart';

class NavigationPage extends StatefulWidget {
  final String title;
  const NavigationPage({Key key, this.title = "Navigation"}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState
    extends ModularState<NavigationPage, NavigationController> {
  Completer<GoogleMapController> _mapsController = Completer();

  final CameraPosition _kUESC = CameraPosition(
    target: LatLng(-14.797483, -39.172245),
    zoom: 17.00,
    bearing: 45,
    tilt: 45,
  );

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    super.initState();
    pavilionList.forEach(
      (element) {
        allMarkers.add(
          Marker(
            markerId: MarkerId(element.name),
            draggable: false,
            infoWindow:
                InfoWindow(title: element.name, snippet: element.address),
            position: element.locationCoords,
          ),
        );
      },
    );
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: controller.sourceLocation,
                bearing: controller.cameraBearing,
                tilt: controller.cameraTilt,
                zoom: controller.cameraZoom,
              ),
              markers: Set.from(allMarkers),
              onMapCreated: (GoogleMapController mapsController){
                mapsController.setMapStyle(controller.mapStyle);
                _mapsController.complete(mapsController);
              },
            ),
          ),
          Positioned(
            bottom: 50.0,
            child: Container(
              height: 130.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: pavilionList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pavilionList(index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _pavilionList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          // moveCamera();
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      pavilionList[index].thumbNail),
                                  fit: BoxFit.cover))),
                      SizedBox(width: 5.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pavilionList[index].name,
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              pavilionList[index].address,
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: 170.0,
                              child: Text(
                                pavilionList[index].description,
                                style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  moveCamera() async {
    final GoogleMapController controller = await _mapsController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: pavilionList[_pageController.page.toInt()].locationCoords,
          zoom: 18.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }
}
