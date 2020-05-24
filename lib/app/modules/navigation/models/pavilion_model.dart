import 'package:google_maps_flutter/google_maps_flutter.dart';

class Pavilion {
  String name;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Pavilion(
      {this.name,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

final List<Pavilion> pavilionList = [
  Pavilion(
    name: 'Pavilhão Jorge Amado',
    address: '', //UESC - Universidade Estadual de Santa Cruz',
    description: 'Pavilhão dedicado aos cursos de Ciências Biológicas',
    locationCoords: LatLng(-14.797105, -39.171346),
    thumbNail: 'https://maps.gstatic.com/tactile/pane/default_geocode-1x.png',
  ),
  Pavilion(
    name: 'Pavilhão Pedro Calmon',
    address: '', //UESC - Universidade Estadual de Santa Cruz',
    description: 'Pavilhão dedicado aos cursos de Ciências Humanas',
    locationCoords: LatLng(-14.797621, -39.173884),
    thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipO2MaBzKH3nxCfe04pM2gxsP9DD4kbWODWTzrSv=w426-h240-k-no',
  ),
  Pavilion(
    name: 'Pavilhão de Ciências Exatas e Tecnológicas',
    address: '', //UESC - Universidade Estadual de Santa Cruz',
    description: 'Pavilhão dedicado aos cursos de Exatas',
    locationCoords: LatLng(-14.796196, -39.171538),
    thumbNail: 'https://maps.gstatic.com/tactile/pane/default_geocode-1x.png',
  ),
  Pavilion(
    name: 'Torre Administrativa',
    address: '', //UESC - Universidade Estadual de Santa Cruz',
    description: '',
    locationCoords: LatLng(-14.796617, -39.172273),
    thumbNail: 'https://maps.gstatic.com/tactile/pane/default_geocode-1x.png',
  ),
  Pavilion(
    name: 'Restaurante Universitário',
    address: '', //UESC - Universidade Estadual de Santa Cruz',
    description: 'RU',
    locationCoords: LatLng(-14.796782, -39.174240),
    thumbNail: 'https://maps.gstatic.com/tactile/pane/default_geocode-1x.png',
  ),
];
