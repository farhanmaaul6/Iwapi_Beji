import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iwapi_beji/components/model.dart';
import 'package:iwapi_beji/pages/update_page.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({Key? key}) : super(key: key);

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  String searchQuery = '';
  TextEditingController searchController = TextEditingController();

  Stream<List<Pengurus>> readPengurus() {
    return FirebaseFirestore.instance.collection('iwapi').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => Pengurus.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  void updatePengurus(Pengurus pengurus) {}

  Future<void> deletePengurus(Pengurus pengurus) async {
    try {
      await FirebaseFirestore.instance
          .collection('iwapi')
          .doc(pengurus.id) // Assuming the Pengurus model has an 'id' field
          .delete();
    } catch (e) {
      // Handle error
      print('Error deleting pengurus: $e');
    }
  }

  Future<void> _showDeleteConfirmationDialog(Pengurus pengurus) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: const Text('Anda yakin ingin menghapus pengurus ini?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Hapus'),
              onPressed: () {
                Navigator.of(context).pop();
                deletePengurus(pengurus);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showUpdateConfirmationDialog(Pengurus pengurus) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Perbarui'),
          content: const Text('Anda yakin ingin memperbarui pengurus ini?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Perbarui'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePage(pengurus: pengurus),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildPengurus(Pengurus pengurus) {
    return ListTile(
      tileColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pengurus.nama,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('No Hp: ${pengurus.noHp ?? ''}'),
          const SizedBox(height: 2),
          Text('Alamat: ${pengurus.alamat}'),
          const SizedBox(height: 2),
          Text('Jenis Usaha : ${pengurus.jenisUsaha}'),
          const SizedBox(height: 2),
          Text('Perizinan : ${pengurus.perizinan}'),
          const SizedBox(height: 2),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              _showUpdateConfirmationDialog(pengurus);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              _showDeleteConfirmationDialog(pengurus);
            },
          ),
        ],
      ),
    );
  }

  @override
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Anggota Iwapi Ranting Beji',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        return Container();
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
                          child: buildPengurus(pengurus),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text("Data kosong ${snapshot.error}"),
                  );
                } else {
                  return const Center(
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
