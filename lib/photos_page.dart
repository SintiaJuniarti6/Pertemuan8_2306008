import 'package:flutter/material.dart';
import 'models/photo_model.dart';
import 'services/photo_service.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {

  late Future<List<PhotoModel>> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = PhotoService.getPhotos();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Daftar Foto"),
        backgroundColor: Colors.pink,
      ),

      body: FutureBuilder<List<PhotoModel>>(

        future: futurePhotos,

        builder: (context, snapshot) {

          if (snapshot.hasData) {

            final photos = snapshot.data!;

            return GridView.builder(

              padding: const EdgeInsets.all(10),

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),

              itemCount: photos.length,

              itemBuilder: (context, index) {

                final photo = photos[index];

                return Card(

                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(

                    children: [

                      Expanded(

                        child: ClipRRect(

                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),

                          child: Image.network(
                            photo.downloadUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),

                        child: Text(
                          photo.author,

                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          else if (snapshot.hasError) {

            return const Center(
              child: Text("Terjadi Error"),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}