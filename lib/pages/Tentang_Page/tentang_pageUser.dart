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
                    'Aplikasi “Iwapi Beji” merupakan aplikasi pendataan pengurus IWAPI Ranting Beji berbasis Android dengan menggunakan framework Flutter dan Firebase sebagai databasenya. Aplikasi ini memungkinkan pengguna untuk mendigitalisasi data setiap pengurus dengan mudah. Aplikasi ini akan meminta data para pengurus seperti nama, nomor telepon, alamat dan jenis usaha.Aplikasi “Iwapi Beji” merupakan aplikasi pendataan pengurus IWAPI Ranting Beji berbasis Android dengan menggunakan framework Flutter dan Firebase sebagai databasenya. Aplikasi ini memungkinkan pengguna untuk mendigitalisasi data setiap pengurus dengan mudah. Aplikasi ini akan meminta data para pengurus seperti nama, nomor telepon, alamat dan jenis usaha.',
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
