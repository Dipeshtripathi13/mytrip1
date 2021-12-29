import 'package:flutter/material.dart';
import 'package:project_1/auth/google_sign_in.dart';
import 'package:project_1/imagefromfirebase/firebase_api.dart';
import 'package:project_1/imagefromfirebase/firebase_file.dart';
import 'package:project_1/imagefromfirebase/firebase_hotel.dart';
import 'package:project_1/imagefromfirebase/firebase_hotelapi.dart';
import 'package:project_1/imagefromfirebase/hotelimage_page.dart';
import 'package:project_1/imagefromfirebase/image_page.dart';
import 'package:project_1/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class AHome extends StatefulWidget {
  const AHome({Key? key}) : super(key: key);

  @override
  _AHomeState createState() => _AHomeState();
}

class _AHomeState extends State<AHome> {
  late Future<List<FirebaseFile>> futureFiles;
  late Future<List<FirebaseHotel>> futureHotels;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('files/');
    futureHotels = FirebaseHotelApi.listAll('hotels/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: const Text("MyTrip",
                style: TextStyle(
                  fontFamily: 'PacificoRegular',
                  color: Colors.white,
                  fontSize: 25,
                )),
          ),
          actions: <Widget>[MyStatelessWidget()]),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text('OPTIONS'),
            ),
            ListTile(
              title: Text("profile"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              title: const Text("settings"),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<List<FirebaseFile>>(
            future: futureFiles,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Some error occurred!'));
                  } else {
                    final files = snapshot.data!;

                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(files.length),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: files.length,
                              itemBuilder: (context, index) {
                                final file = files[index];

                                return buildFile(context, file);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FutureBuilder<List<FirebaseHotel>>(
              future: futureHotels,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Center(child: Text('Some error occurred!'));
                    } else {
                      final files = snapshot.data!;

                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildHeaderHotel(files.length),
                            const SizedBox(height: 12),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: files.length,
                                itemBuilder: (context, index) {
                                  final file = files[index];

                                  return buildHotel(context, file);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file) => Container(
        width: 200,
        child: Card(
          child: GestureDetector(
            child: Stack(children: <Widget>[
              (Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    file.url,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      color: Colors.black.withOpacity(0.6),
                      
                      child: Center(
                        child: Text(
                          basenameWithoutExtension(file.name),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ImagePage(file: file),
            )),
          ),
        ),
      );
  Widget buildHeader(int length) => ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: Colors.purple,
        leading: Container(
          width: 52,
          height: 52,
          child: Icon(
            Icons.place_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          '$length Places',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
  Widget buildHotel(BuildContext context, FirebaseHotel hotel) => Container(
        width: 200,
        child: Card(
          child: GestureDetector(
            child: Stack(children: <Widget>[
              (Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    hotel.url,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      color: Colors.black.withOpacity(0.6),
                      child: Center(
                        child: Text(
                          basenameWithoutExtension(hotel.name),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HotelImagePage(
                hotel: hotel,
              ),
            )),
          ),
        ),
      );
  Widget buildHeaderHotel(int length) => ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: Colors.purple,
        leading: Container(
          width: 52,
          height: 52,
          child: Icon(
            Icons.local_hotel,
            color: Colors.white,
          ),
        ),
        title: Text(
          '$length Hotels',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.logout,
        color: Colors.white,
        size: 30,
      ),
      tooltip: 'Log out',
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alert!!'),
          content: const Text('Are you sure you want to log out??'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                Navigator.pop(context, 'Log out');
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
