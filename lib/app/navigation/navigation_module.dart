import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uesc_hub/app/navigation/navigation_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/navigation/navigation_page.dart';

class NavigationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NavigationController()),
        // Bind(
        //   (i) => GoogleMap(
        //     initialCameraPosition: CameraPosition(
        //       target: LatLng(37.42796133580664, -122.085749655962),
        //       zoom: 14.4746,
        //     ),
        //   ),
        // ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NavigationPage()),
      ];

  static Inject get to => Inject<NavigationModule>.of();
}
