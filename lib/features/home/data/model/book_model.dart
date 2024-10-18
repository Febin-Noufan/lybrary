import '../../domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required String id,
    required String title,
    required String description,
    required String publishedDate,
    required String authorId,
    required String coverPictureURL,
    required double price,
  }) : super(
          id: id,
          title: title,
          description: description,
          publishedDate: publishedDate,
          authorId: authorId,
          coverPictureURL: coverPictureURL,
          price: price,
        );

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      publishedDate: json['publishedDate'],
      authorId: json['authorId'],
      coverPictureURL: json['coverPictureURL'],
      price: json['price'].toDouble(),
    );
  }
}
