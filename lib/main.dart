import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'rumah makan sedap rasa';
    biodata['email'] = 'jokowi.@gmail.com';
    biodata['phone'] = '+6287654321';
    biodata['image'] = '2.jpg';
    // biodata['hobby'] = 'Mencari hobi';
    // biodata['addr'] = 'Bojonegoro';
    biodata['desc'] = "'makanan sedap rasa dijaminm enak dan menghabiskan nasi'";
    biodata['openingHours'] = '10:00 - 22:00';
    biodata['menu'] = 'Nasi Goreng, Mie Ayam, Bakso, Soto';
    biodata['restaurantAddress'] = 'Jl. Raya semarang No.123';
  }

  @override
  Widget build(BuildContext context) {
    Future launch(String uri) async {
      if (!await launchUrl(Uri.parse(uri))) {
        throw Exception('Tidak dapat memanggil : $uri');
      }
    }

    Expanded btnContact(IconData icon, var color, String uri) {
      return Expanded(
        child: ElevatedButton(
          onPressed: () {
            launch(uri);
          },
          child: Icon(icon),
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: color,
              foregroundColor: Colors.white),
        ),
      );
    }

    Row textAttribute(String judul, String teks) {
      return Row(
        children: [
          Container(
            width: 80,
            child: Text(
              '- $judul ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Text(
            ': ',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            teks,
            style: TextStyle(fontSize: 18),
          ),
        ],
      );
    }

    Container teksKotak(Color bgColor, String teks) {
      return Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(color: bgColor),
        child: Text(
          teks,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
    }

    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black),
                child: Text(
                  biodata['name'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 10),
              Row(
                children: [
                  btnContact(Icons.alternate_email, Colors.green[900],
                      "mailto:${biodata['email'] ?? ''}"),
                  btnContact(Icons.mark_email_read, Colors.blueAccent,
                      "https://wa.me/${biodata['phone']}"),
                  btnContact(
                      Icons.phone, Colors.deepPurple, "tel:${biodata['phone']}"),
                ],
              ),
              SizedBox(height: 10),
              // textAttribute('Hobby', biodata['hobby'] ?? ''),
              // textAttribute('Alamat', biodata['addr'] ?? ''),
              SizedBox(height: 10),
              teksKotak(Colors.black38, 'Deskripsi'),
              SizedBox(height: 10),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Divider(height: 30, thickness: 2),
              teksKotak(Colors.blueAccent, 'Menu'),
              SizedBox(height: 10),
              Text(
                biodata['menu'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              teksKotak(Colors.teal, 'Alamat Restoran'),
              SizedBox(height: 10),
              Text(
                biodata['restaurantAddress'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              teksKotak(Colors.deepOrange, 'Jam Buka'),
              SizedBox(height: 10),
              Text(
                biodata['openingHours'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
