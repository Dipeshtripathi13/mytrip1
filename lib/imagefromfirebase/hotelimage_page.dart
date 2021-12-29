
import 'package:flutter/material.dart';
import 'package:project_1/imagefromfirebase/firebase_hotel.dart';

import 'firebase_api.dart';
import 'firebase_file.dart';
import 'package:path/path.dart';
class HotelImagePage extends StatelessWidget {
  final FirebaseHotel hotel;

  const HotelImagePage({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isImage = ['.jpeg', '.jpg', '.png'].any(hotel.name.contains);

    return Scaffold(
      appBar: AppBar(
        
        title: Text(basenameWithoutExtension(hotel.name)),//to remove the extension form file name
        
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () async {
              await FirebaseApi.downloadFile(hotel.ref);

              final snackBar = SnackBar(
                content: Text('Downloaded ${hotel.name}'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: isImage
          ? Image.network(
              hotel.url,
              height: double.infinity,
              fit: BoxFit.cover,
            )
          : Center(
              child: Text(
                'Cannot be displayed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}