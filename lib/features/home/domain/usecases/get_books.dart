import '../repositories/book_repository.dart';

import '../entities/book.dart';

class GetBooks {
  final BookRepository repository;

  GetBooks(this.repository);

  Future<Either<Failure, List<Book>>> call() async {
    return await repository.getBooks();
  }
}
