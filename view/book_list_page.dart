import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar untuk menampilkan bar paling atas pada app
      appBar: AppBar(
        title: Text("Book Catalogue"),
      ),
      
      //shortcut ctrl + space untuk menunjukan auto complete
      body: Container(),
    );
  }
}
