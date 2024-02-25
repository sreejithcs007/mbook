class BookModel {
  final String title;
  final String author;
  final String thumbnailUrl;
  final String description;
  final String publishedDate;
  final int pageCount;
  final String publisher;
  final double averageRating;

  BookModel({required this.title, required this.author, required this.thumbnailUrl,required this.description,required this.publishedDate,required this.publisher,
    required this.pageCount,
  required this.averageRating,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    print("Decoding JSON: $json");

    return BookModel(
      title: json['volumeInfo']['title'] ?? "Notitle",
      author: json['volumeInfo']['authors'] != null ? json['volumeInfo']['authors'][0] : 'Unknown',
      thumbnailUrl: json['volumeInfo']['imageLinks'] != null
          ? json['volumeInfo']['imageLinks']['thumbnail']
          : '',
      description: json['volumeInfo']['description'] ?? '',
      publishedDate: json['volumeInfo']['publishedDate'] ?? '',
      pageCount: json['volumeInfo']['pageCount'] ?? 0,
      publisher: json['volumeInfo']['publisher'] != null ? json['volumeInfo']['publisher'] : 'unknown',
      averageRating: json['volumeInfo']['averageRating']?.toDouble() ?? 0.0

    );
  }
}