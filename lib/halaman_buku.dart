import 'package:flutter/material.dart';
import 'package:kuis124210039/data_buku.dart';
import 'package:kuis124210039/halaman_detail.dart';


class halamanBuku extends StatelessWidget{
  const halamanBuku ({super.key});

  // @override
  // Widget build(BuildContext context){
  //   return Scaffold(
  //       appBar: AppBar(
  //         backgroundColor: Colors.deepPurple,
  //         title: Text('Halaman Buku'),
  //       ),
  //       body: ListView.builder(
  //         itemCount: listBuku.length,
  //         itemBuilder: (context, index) {
  //           final DataBuku buku = listBuku[index];
  //           return InkWell(
  //             onTap: (){
  //               Navigator.push(
  //                   context, MaterialPageRoute(
  //                   builder: (context) => halamanDetail(buku: buku)
  //               )
  //               );
  //             },
  //             child: Card(
  //               child: SizedBox(//mengatur tinggi dan lebar
  //                 height: 100,
  //                 width: MediaQuery.of(context).size.width, // agar lebih fleksibel dengan tampilan display
  //                 child: Row(
  //                   children: [
  //                     SizedBox( // gambar dimasukan ke SizeBox dengan image-> alt+enter -> SizeBox, agar tampilan lebih rapi
  //                       height: 200,
  //                       width: MediaQuery.of(context).size.width / 3, // dibagi agar gambar sesuai
  //                       child: Image.network(
  //                         buku.imageLink,
  //                         fit: BoxFit.fill,
  //                       ),
  //                     ),
  //                     Text(buku.title),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       )
  //   );
  // }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('List of Book')
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: listBuku.length,
                itemBuilder: (context, index) {
                  final DataBuku buku = listBuku[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => halamanDetail(buku: buku)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width /3 ,
                              child: Image(
                                image: NetworkImage(buku.imageLink),
                                height: 180,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              buku.author,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            )
        ),
      );
  }
}