import 'dart:convert';

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
  
  //membuat variabel yang dapat di akses dari manapun
  BookListResponse? bookList;
  
   //membuat fungsi untuk bukunya
  //link untuk isi fungsi di bawah ("https://pub.dev/packages/http")
  // karena await merupakan 'await' pasti merupakan fungsi asyncronus, maka perlu di tambahkan async setelah fectBookApi()
  fectBookApi() async {
    var url = Uri.parse('https://api.itbook.store/1.0/new');
    var response =
        await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    
    //memeriksa status response, 200 == ok
    if (response.statusCode == 200) {
      //mengubah string menjadi sebuah json
      final jsonBookList = jsonDecode(response.body);
      
      //melakukan parsing
      bookList = BookListResponse.fromJson(jsonBookList);
      setState(() {
        
      });
    }

    //print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }
  
  //initState akan dijalankan saat halaman book_list terbuka
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fectBookApi();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar untuk menampilkan bar paling atas pada app
      appBar: AppBar(
        title: Text("Book Catalogue"),
      ),
      
      //shortcut ctrl + space untuk menunjukan auto complete
      body: Container(
        child: bookList == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  final currentBook = bookList!.books![index];
                  return Row(
                    children: [
                      Image.network(
                        currentBook.image!,
                        height: 100,
                      ),
                      Column(
                        children: [
                          Text(currentBook.title!),
                          Text(currentBook.subtitle!),
                          Text(currentBook.price!),
                        ],
                      )
                    ],
                  );
                },
              ),
      ),
    );
  }
}
