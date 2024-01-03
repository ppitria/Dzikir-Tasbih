import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart'; // Pastikan Anda mengganti 'app_state.dart' sesuai dengan nama file yang sesuai

class tasbih_digital extends StatefulWidget {
  @override
  _TasbihDigitalState createState() => _TasbihDigitalState();
}

class _TasbihDigitalState extends State<tasbih_digital> {
  int count = 0;
  int _counterLimit = 0;
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    void reset() {
      setState(() {
        appState.reset();
        _counterLimit = 0;
        count = 0;
      });
    }

    void counter() {
      setState(() {
        if (_counterLimit == 0 || count < _counterLimit) {
          appState.counter();
          count = appState.count;
        }
      });
    }

    void setCounterLimit(int counterLimit) {
      setState(() {
        appState.reset();
        _counterLimit = counterLimit;
        count = 0;
      });
    }

    void _showOptionsDialog() {
      String dzikirText = '';
      String counterText = '';

      if (isEditing) {
        dzikirText =
            appState.dzikirList.isNotEmpty ? appState.dzikirList.last : '';
        counterText = _counterLimit.toString();
      }

      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(isEditing ? 'Edit Dzikir' : 'Tambah Dzikir'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      dzikirText = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Masukkan kalimat dzikir',
                    ),
                    controller: TextEditingController(text: dzikirText),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      counterText = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Masukkan jumlah dzikir',
                    ),
                    controller: TextEditingController(text: counterText),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (dzikirText.isNotEmpty && counterText.isNotEmpty) {
                    if (isEditing) {
                      appState.editDzikirList(dzikirText);
                    } else {
                      appState.addToDzikirList(dzikirText);
                    }
                    setCounterLimit(int.parse(counterText));
                    isEditing = false;
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(124, 92, 60,
                      1), // Ganti warna latar tombol sesuai keinginan
                ),
                child: Text(
                  isEditing ? 'Simpan Perubahan' : 'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    }

    Widget _buildDzikirContainer() {
      return GestureDetector(
        onTap: () {
          setState(() {
            isEditing = true;
          });
          _showOptionsDialog();
        },
        child: Container(
          height: 50.0,
          width: double.infinity,
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              appState.dzikirList.isNotEmpty
                  ? appState.dzikirList.last
                  : 'Tidak ada dzikir',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Tasbih Digital',
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
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Added counter limit container
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(159, 112, 79, 1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        color: Color.fromRGBO(159, 112, 79, 1).withOpacity(.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Text(
                        appState.count.toString(),
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(159, 112, 79, 1),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          color:
                              Color.fromRGBO(159, 112, 79, 1).withOpacity(.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: counter,
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(80, 80),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(159, 112, 79, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: reset,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color.fromRGBO(30, 24, 18, 1),
                          ),
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            child: _buildDzikirContainer(),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                _showOptionsDialog();
              },
              child: Icon(Icons.add),
              foregroundColor: Colors.white,
              backgroundColor: Color.fromRGBO(159, 112, 79, 1),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
