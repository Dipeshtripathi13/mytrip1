import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHotel {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseHotel({
    required this.ref,
    required this.name,
    required this.url,
  });
}
