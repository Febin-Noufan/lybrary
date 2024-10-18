class Book {
  final String id;
  final String title;
  final String description;
  final String publishedDate;
  final String authorId;
  final String coverPictureURL;
  final double price;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedDate,
    required this.authorId,
    required this.coverPictureURL,
    required this.price,
  });
}
