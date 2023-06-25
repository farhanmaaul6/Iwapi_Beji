import 'package:flutter/material.dart';

class TentangPageUser extends StatelessWidget {
  const TentangPageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        leadingWidth: 48,
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        title: Text(
          "Tentang",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, ('/Navbarpageuser'));
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sekilas tentang aplikasi ini:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aplikasi Dapurku merupakan aplikasi yang dapat membantu kegiatan inventaris bahan dapur pada tingkat rumah tangga. Aplikasi ini memudahkan pengguna dalam menginventarisir bahan dapur yang ada di dapur pengguna. Aplikasi ini dibuat guna melengkapi sebagian syarat dalam mencapai gelar setara sarjana muda, yaitu Penulisan ilmiah.',
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Aplikasi ini dibuat oleh: ',
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Farhan Maulana M \n50420462',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Dengan Bimbingan : ',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Pak Priyo',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
