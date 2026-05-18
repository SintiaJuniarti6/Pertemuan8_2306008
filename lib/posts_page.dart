import 'package:flutter/material.dart';
import 'models/post_model.dart';
import 'services/post_service.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  late Future<List<PostModel>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = PostService.getPosts();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Daftar Postingan"),
        backgroundColor: Colors.blue,
      ),

      body: FutureBuilder<List<PostModel>>(

        future: futurePosts,

        builder: (context, snapshot) {

          if (snapshot.hasData) {

            final posts = snapshot.data!;

            return ListView.builder(

              itemCount: posts.length,

              itemBuilder: (context, index) {

                final post = posts[index];

                return Card(

                  margin: const EdgeInsets.all(10),
                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          post.title,

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          post.body,

                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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