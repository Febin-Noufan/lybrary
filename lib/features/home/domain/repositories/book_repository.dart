import 'package:dartz/dartz.dart';
import '../entities/book.dart';
import '../../../../core/error/failures.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getBooks();
}
