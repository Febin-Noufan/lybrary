import 'package:book/features/home/data/book_bloc.dart';
import 'package:book/features/home/data/model/book_model.dart';
import 'package:book/features/home/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookBloc = BlocProvider.of<BookBloc>(context);
    bookBloc.add(FetchBooks()); 

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Book Store',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const LinearProgressIndicator();
                  } else if (state is BookLoaded) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(14),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: state.books.length,
                      itemBuilder: (context, index) {
                        return BookCard(book: state.books[index]);
                      },
                    );
                  }
                  return const Center(
                    child: Text("No book found"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
              child: Image.network(
                
                book.coverPictureURL,
                fit: BoxFit.cover,
                width: 106,
                height: 160,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          book.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          book.publishedDate,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          '₹${book.price}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
