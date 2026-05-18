class PhotoModel {

  final String author;
  final String downloadUrl;

  PhotoModel({
    required this.author,
    required this.downloadUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {

    return PhotoModel(
      author: json['author'],
      downloadUrl: json['download_url'],
    );
  }
}