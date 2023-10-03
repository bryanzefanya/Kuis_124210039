import 'package:flutter/material.dart';
import 'package:kuis124210039/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

//
// class halamanDetail extends StatelessWidget{
//   final DataBuku buku;
//   const halamanDetail ({super.key, required this.buku});
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         // automaticallyImplyLeading: false, //jika ingin menghilangkan leading
//         title: Text(buku.title),
//       ),
//       body: Column(
//         // padding: EdgeInsets.all(10),
//         child: Container(
//           child: ListView(
//             children: [
//               Text(buku.title, style: TextStyle(fontWeight: FontWeight.bold)),
//               Row(
//                 // Text('Judul Buku'),
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     height: MediaQuery.of(context).size.height / 3,
//                     width : MediaQuery.of(context).size.width,
//                     child: Image.network(buku.imageLink),),
//                   Container(child: Text(buku.author),
//
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           _launchUrl('https://spada.upnyk.ac.id');
//         },
//         child: Icon(Icons.open_in_browser),
//       ),
//     );
//   }
//   Future<void> _launchUrl(String url) async {
//     final Uri _url = Uri.parse(url);
//     if (!await launchUrl(_url)) {
//       throw Exception('Could not launch $_url');
//     }
//   }
// }


class halamanDetail extends StatelessWidget {
  halamanDetail({super.key, required this.buku});
  final DataBuku buku;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(buku.author)
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: <Widget>[
          BookmarkButton(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(buku.imageLink),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  buku.author,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  buku.country,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  buku.language,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  buku.pages.toString() ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  buku.year.toString()  ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  buku.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launcher(buku.link);
        },
        tooltip: 'Open Web',
        child: Icon(Icons.open_in_browser),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  final Uri _url = Uri.parse('https://flutter.dev');
  Future<void> _launcher(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw Exception("gagal membuka url : $_url");
    }
  }

}
class BookmarkButton extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}
class _BookmarkButtonState extends State<BookmarkButton> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isBookmarked ? Icons.favorite : Icons.favorite_border,
        color: _isBookmarked ? Colors.white : null,

      ),
      onPressed: () {
        setState(() {
          _isBookmarked = !_isBookmarked;
          _isBookmarked = true;
        });
        // Show a snackbar indicating the bookmark state
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isBookmarked ? 'Berhasil menambahkan ke favorit.' : 'Berhasil menghapus dari favorit.'),
            backgroundColor : _isBookmarked ? Colors.lightGreen : Colors.red,
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}