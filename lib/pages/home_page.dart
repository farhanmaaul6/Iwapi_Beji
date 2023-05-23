import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iwapi_beji/components/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<List<Pengurus>> readPengurus() => FirebaseFirestore.instance
      .collection('iwapi')
      .snapshots()
      .map((Snapshot) =>
          Snapshot.docs.map((doc) => Pengurus.fromJson(doc.data())).toList());

  Widget buildPengurus(Pengurus pengurus) => ListTile(
      leading: CircleAvatar(),
      title: Text(pengurus.nama),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //Text('${pengurus.noHp}'),
        Text(pengurus.alamat),
        //Text(pengurus.jenisUsaha),
      ]));

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: readPengurus(),
        builder: (context, Snapshot) {
          if (Snapshot.hasError) {
            return Text('Something Went Wrong! ${Snapshot.error}');
          } else if (Snapshot.hasData) {
            final pengurus = Snapshot.data!;
            return ListView(
              children: pengurus.map(buildPengurus).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
