import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class dzikir_petang extends StatefulWidget {
  @override
  _DzikirPetangState createState() => _DzikirPetangState();
}

class _DzikirPetangState extends State<dzikir_petang> {
  List<Map<String, dynamic>> dzikirData = [];

  Future<void> fetchDzikir() async {
    const apiUrl = 'https://dzikr-omega.vercel.app/dzikir-pagi';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);

        if (data is List) {
          setState(() {
            dzikirData = data.cast<Map<String, dynamic>>();
          });
        } else {
          throw Exception(
              'Data dari API bukan merupakan List<Map<String, String>>');
        }
      } else {
        throw Exception(
            'Gagal mengambil data dari API: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Terjadi kesalahan saat mengambil data'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDzikir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dzikir Petang',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(124, 92, 60, 1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromRGBO(124, 92, 60, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset(
                  'assets/images/Dzikrullah putih.png',
                  width: 300,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/icon_pagi.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  'Dzikir Pagi',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/dzikir_pagi');
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/icon_petang.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  'Dzikir Petang',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/dzikir_petang');
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/icon_tasbih.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  'Tasbih Digital',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/tasbih_digital');
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: dzikirData.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dzikirData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Text(
                          dzikirData[index]['arab'] ?? '',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          dzikirData[index]['indo'] ?? '',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          dzikirData[index]['ulangi'] ?? '',
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
