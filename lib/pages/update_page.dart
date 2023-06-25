import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iwapi_beji/components/model.dart';

class UpdatePage extends StatefulWidget {
  final Pengurus pengurus;

  const UpdatePage({Key? key, required this.pengurus}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController updateNama = TextEditingController();
  TextEditingController updateAlamat = TextEditingController();
  TextEditingController updatenoHp = TextEditingController();
  TextEditingController updateJenisUsaha = TextEditingController();
  TextEditingController updateperizinan = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the text field controllers with the provided data for editing
    updateNama.text = widget.pengurus.nama;
    updateAlamat.text = widget.pengurus.alamat;
    updatenoHp.text = widget.pengurus.noHp.toString();
    updateJenisUsaha.text = widget.pengurus.jenisUsaha;
    updateperizinan.text = widget.pengurus.perizinan;
  }

  Future<void> updatePengurus(Pengurus pengurus) async {
    final docPengurus =
        FirebaseFirestore.instance.collection('iwapi').doc(pengurus.id);
    final json = pengurus.toJson();
    if (pengurus.noHp != null) {
      json['noHp'] = int.parse(pengurus.noHp!);
    }

    await docPengurus.update({
      'nama': pengurus.nama,
      'alamat': pengurus.alamat,
      'noHp': pengurus.noHp,
      'jenisUsaha': pengurus.jenisUsaha,
      'perizinan': pengurus.perizinan,
    });
  }

  void showUpdateConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sukses'),
          content: const Text('Data pengurus telah diperbarui.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/Navbarpage');
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Ubah Anggota',
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
            controller: updateNama,
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
            controller: updateAlamat,
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
            controller: updatenoHp,
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
            controller: updateJenisUsaha,
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
            controller: updateperizinan,
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
            onPressed: () {
              final pengurus = Pengurus(
                  id: widget.pengurus.id,
                  nama: updateNama.text,
                  alamat: updateAlamat.text,
                  noHp: updatenoHp.text,
                  jenisUsaha: updateJenisUsaha.text,
                  perizinan: updateperizinan.text);

              updatePengurus(pengurus);
              showUpdateConfirmation();
            },
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text('Ubah Data Anggota'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
