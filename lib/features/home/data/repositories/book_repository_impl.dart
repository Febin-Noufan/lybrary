import 'package:dartz/dartz.dart';
import '../../domain/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/book_repository.dart';
import '../datasources/book_remote_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Book>>> getBooks() async {
    try {
      final books = await remoteDataSource.fetchBooks();
      return Right(books);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
