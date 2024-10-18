import 'package:book/features/home/data/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookBloc = BlocProvider.of<BookBloc>(context);

    // Dispatch the FetchBooks event when the widget is built
    bookBloc.add(FetchBooks());

    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BookLoaded) {
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.books[index].title),
                );
              },
            );
          } else if (state is BookError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No books found.'));
        },
      ),
    );
  }
}
