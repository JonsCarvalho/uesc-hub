import 'dart:convert';

mapStyle() {
  return jsonEncode(
    [
      {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
          {"color": "#444444"}
        ]
      },
      {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
          {"color": "#f2f2f2"}
        ]
      },
      {
        "featureType": "landscape.man_made",
        "elementType": "geometry.fill",
        "stylers": [
          {"visibility": "on"},
          {"color": "#46d1b3"}
        ]
      },
      {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
          {"visibility": "off"}
        ]
      },
      {
        "featureType": "poi.business",
        "elementType": "geometry.fill",
        "stylers": [
          {"visibility": "on"}
        ]
      },
      {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
          {"visibility": "on"},
          {"hue": "#24ff00"}
        ]
      },
      {
        "featureType": "poi.school",
        "elementType": "geometry.fill",
        "stylers": [
          {"visibility": "on"},
          {"color": "#ece6c3"}
        ]
      },
      {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
          {"saturation": -100},
          {"lightness": 45}
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
          {"visibility": "simplified"}
        ]
      },
      {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
          {"visibility": "off"}
        ]
      },
      {
        "featureType": "road.local",
        "elementType": "geometry.fill",
        "stylers": [
          {"visibility": "on"},
          {"color": "#ffffff"},
          {"weight": "2.94"}
        ]
      },
      {
        "featureType": "road.local",
        "elementType": "geometry.stroke",
        "stylers": [
          {"visibility": "on"},
          {"color": "#ffbc00"},
          {"weight": "1.61"}
        ]
      },
      {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
          {"visibility": "off"}
        ]
      },
      {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
          {"color": "#09e8ba"},
          {"visibility": "on"}
        ]
      },
      {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
          {"visibility": "on"},
          {"color": "#00b5ff"}
        ]
      }
    ],
  );
}
