import 'package:latlong2/latlong.dart';

class User {
  final String name;
  final String mail;
  final String phoneNumber;
  final String password;
  final LatLng location;
  final String imageUrl;

  User(this.name, this.mail, this.phoneNumber, this.password, this.location,
      this.imageUrl);
}
