import 'package:flutter/material.dart';

class IwapiUser extends StatelessWidget {
  const IwapiUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'Tentang IWAPI',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sejarah Singkat',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'IWAPI (Ikatan Wanita Pengusaha Indonesia) didirikan pada tanggal 16 Juni 1984. Organisasi ini bertujuan untuk mendukung, mengembangkan, dan memberdayakan perempuan dalam dunia bisnis di Indonesia. IWAPI menjadi wadah bagi perempuan pengusaha Indonesia untuk saling berbagi pengetahuan, pengalaman, dan mendapatkan dukungan dalam mengembangkan bisnis mereka. Sejak berdirinya, IWAPI telah aktif dalam mengadakan berbagai kegiatan dan program untuk memajukan perempuan di bidang bisnis.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 30),
              Text(
                'Visi Misi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                'Visi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                'Menjadi organisasi yang memperkuat posisi perempuan sebagai agen perubahan ekonomi di Indonesia.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              Text(
                'Misi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                '1. Mendukung pengembangan potensi perempuan dalam dunia bisnis.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                '2. Memberikan pemahaman dan keterampilan kepada perempuan untuk berwirausaha.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                '3. Membangun jaringan kerjasama dan kolaborasi antar perempuan pengusaha.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                '4. Mewujudkan kesetaraan gender dan keadilan sosial dalam dunia bisnis.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
