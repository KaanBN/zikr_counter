import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zikir_sayar/Notifiers/ZikrNotifier.dart';
import 'package:zikir_sayar/Notifiers/ZikrProvider.dart';

class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  late Zikrnotifier zikrProvider;
  late SharedPreferences prefs;
  bool _isInitialized = false;

  void addZikr(String name){
    zikrProvider.updateZikrList(
      {
        "name": name,
        "count": 0
      }
    );
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPrefs().then((_) {
      setState(() {
        _isInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    zikrProvider = Zikrprovider.of(context);

    if (!_isInitialized) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        backgroundColor: Colors.green,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: zikrProvider.nameJsonList.isEmpty
            ? const Text(
          "You haven't adde any zikr yet",
          style: TextStyle(fontSize: 24, color: Colors.white),
        )
            : const Placeholder(), // Replace with any other widget you want to show
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
