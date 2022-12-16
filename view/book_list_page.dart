import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  
   //membuat fungsi untuk bukunya
  //link untuk isi fungsi di bawah ("https://pub.dev/packages/http")
  fectBookApi(){
var url = Uri.https('example.com', 'whatsit/create');
var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }
  
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
