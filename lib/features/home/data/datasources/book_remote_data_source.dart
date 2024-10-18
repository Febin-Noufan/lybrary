import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/book_model.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> fetchBooks();
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  @override
  Future<List<BookModel>> fetchBooks() async {
    final response = await http.get(
      Uri.parse('https://assessment.eltglobal.in/api/books?page=1&limit=10'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> booksJson = jsonResponse['result'];
      return booksJson.map((bookJson) => BookModel.fromJson(bookJson)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
