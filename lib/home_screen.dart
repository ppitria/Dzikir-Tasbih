import 'package:flutter/material.dart';
import 'package:dzikir_tasbih/dzikir_pagi.dart';
import 'package:dzikir_tasbih/dzikir_petang.dart';
import 'package:dzikir_tasbih/tasbih_digital.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/Dzikrullah 3.png',
                  width: 300,
                  height: 80,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () {
                  // Aksi yang ingin dilakukan saat tombol 'Dzikir Pagi' ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            dzikir_pagi()), // Ganti dengan halaman yang diinginkan
                  );
                },
                child: Text("Dzikir Pagi", style: TextStyle(fontSize: 18)),
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(30, 24, 18, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color.fromRGBO(30, 24, 18, 1)),
                    ),
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Color.fromRGBO(239, 216, 195, 0.68);
                      }
                      if (states.contains(MaterialState.pressed)) {
                        return Color.fromRGBO(124, 92, 60, 50);
                      }
                      return Colors
                          .transparent; // Efek default jika tidak di-hover atau ditekan
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () {
                  // Aksi yang ingin dilakukan saat tombol 'Dzikir Petang' ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            dzikir_petang()), // Ganti dengan halaman yang diinginkan
                  );
                },
                child: Text("Dzikir Petang", style: TextStyle(fontSize: 18)),
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(30, 24, 18, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color.fromRGBO(30, 24, 18, 1))),
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Color.fromRGBO(239, 216, 195, 0.68);
                      }
                      if (states.contains(MaterialState.pressed)) {
                        return Color.fromRGBO(124, 92, 60, 50);
                      }
                      return Colors
                          .transparent; // Efek default jika tidak di-hover atau ditekan
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () {
                  // Aksi yang ingin dilakukan saat tombol 'Tasbih Digital' ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            tasbih_digital()), // Ganti dengan halaman yang diinginkan
                  );
                },
                child: Text("Tasbih Digital", style: TextStyle(fontSize: 18)),
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(30, 24, 18, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color.fromRGBO(30, 24, 18, 1))),
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Color.fromRGBO(239, 216, 195, 0.68);
                      }
                      if (states.contains(MaterialState.pressed)) {
                        return Color.fromRGBO(124, 92, 60, 50);
                      }
                      return Colors
                          .transparent; // Efek default jika tidak di-hover atau ditekan
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh halaman yang dapat Anda navigasikan




