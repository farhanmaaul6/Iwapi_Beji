import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iwapi_beji/components/model.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController jenisUsahaController = TextEditingController();
  TextEditingController perizinanController = TextEditingController();

  Future<void> createPengurus(Pengurus pengurus) async {
    final docPengurus = FirebaseFirestore.instance.collection('iwapi').doc();
    pengurus.id = docPengurus.id;

    final json = pengurus.toJson();
    await docPengurus.set(json);
  }

  Future<void> _showSuccessDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sukses'),
          content: const Text('Data pengurus telah ditambahkan.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/Navbarpageadmin');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Tambah Anggota',
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
          TextField(
            controller: perizinanController,
            decoration: InputDecoration(
              labelText: 'Perizinan',
              prefixIcon: Icon(Icons.home_repair_service_sharp),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () async {
              final pengurus = Pengurus(
                nama: namaController.text,
                alamat: alamatController.text,
                noHp: noHpController.text,
                jenisUsaha: jenisUsahaController.text,
                perizinan: perizinanController.text,
              );

              await createPengurus(pengurus);

              await _showSuccessDialog();
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
