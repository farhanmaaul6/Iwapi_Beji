import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iwapi_beji/components/model.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController jenisUsahaController = TextEditingController();

  Future createPengurus(Pengurus pengurus) async {
    final docPengurus = FirebaseFirestore.instance.collection('iwapi').doc();
    pengurus.id = docPengurus.id;

    final json = pengurus.toJson();
    await docPengurus.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Text(
            'Tambah Pengurus',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: namaController,
            decoration: InputDecoration(
              labelText: 'Nama',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: alamatController,
            decoration: InputDecoration(
              labelText: 'Alamat',
              prefixIcon: Icon(Icons.home),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: noHpController,
            decoration: InputDecoration(
              labelText: 'No.Hp',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: jenisUsahaController,
            decoration: InputDecoration(
              labelText: 'Jenis Usaha',
              prefixIcon: Icon(Icons.business_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              final pengurus = Pengurus(
                nama: namaController.text,
                alamat: alamatController.text,
                //noHp: int.parse(noHpController.text),
                //jenisUsaha: jenisUsahaController.text,
              );

              createPengurus(pengurus);

              Navigator.pushReplacementNamed(context, '/Navbarpage');
            },
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text('Tambah Data'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
