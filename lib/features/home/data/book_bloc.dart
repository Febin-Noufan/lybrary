// 

import 'package:book/features/home/data/model/book_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// Events
abstract class BookEvent {}

class FetchBooks extends BookEvent {}



// States
abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;

  BookLoaded({required this.books});
}

class BookError extends BookState {
  final String message;

  BookError({required this.message});
}
// BLoC
class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<FetchBooks>((event, emit) async {
      emit(BookLoading());

      try {
        // Make the HTTP GET request
        final response = await http.get(
          Uri.parse('https://assessment.eltglobal.in/api/books?page=1&limit=10'),
        );

        if (response.statusCode == 200) {
          // Parse the JSON response
          final Map<String, dynamic> jsonResponse = json.decode(response.body);
          final List<dynamic> booksJson = jsonResponse['result'];

          // Map the JSON list to Book objects
          List<Book> books = booksJson.map((bookJson) => Book.fromJson(bookJson)).toList();

          emit(BookLoaded(books: books));
        } else {
          emit(BookError(message: 'Failed to load books: ${response.reasonPhrase}'));
        }
      } catch (e) {
        emit(BookError(message: e.toString()));
      }
    });
  }
}