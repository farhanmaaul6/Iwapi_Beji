import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iwapi_beji/components/model.dart';
import 'package:iwapi_beji/pages/update_page.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({Key? key}) : super(key: key);

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  String searchQuery = '';
  TextEditingController searchController = TextEditingController();

  Stream<List<Pengurus>> readPengurus() {
    return FirebaseFirestore.instance.collection('iwapi').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => Pengurus.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  Widget buildPengurus(int index, Pengurus pengurus) {
    return ListTile(
      tileColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pengurus.nama,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('No Hp: ${pengurus.noHp ?? ''}'),
          SizedBox(height: 2),
          Text('Alamat: ${pengurus.alamat}'),
          SizedBox(height: 2),
          Text('Jenis Usaha : ${pengurus.jenisUsaha}'),
          SizedBox(height: 2),
          Text('Perizinan : ${pengurus.perizinan}'),
          SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 8, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Anggota Iwapi Ranting Beji',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Pengurus>>(
              stream: readPengurus(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final pengurusList = snapshot.data!;
                  return ListView.builder(
                    itemCount: pengurusList.length,
                    itemBuilder: (context, index) {
                      final pengurus = pengurusList[index];
                      if (searchQuery.isNotEmpty &&
                          !pengurus.nama
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase())) {
                        return Container(); // Skip if the name doesn't match the search query
                      }
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[200]!,
                            width: 6,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: buildPengurus(index, pengurus),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text("Data kosong ${snapshot.error}"),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
