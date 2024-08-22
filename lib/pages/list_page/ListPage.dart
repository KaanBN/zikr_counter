import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zikir_sayar/Notifiers/ZikrProvider.dart';
import 'package:zikir_sayar/pages/list_page/widgets/ZikrList.dart';

class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  late SharedPreferences prefs;
  bool _isInitialized = false;
  final _nameController = TextEditingController();

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
    final zikrProvider = Provider.of<ZikrProvider>(context);

    void addZikr(String name){
      zikrProvider.addZikr(name);
    }

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
      body: const Center(
        child: Zikrlist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Zikr'),
                content: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Zikr Name',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      addZikr(_nameController.text);
                      _nameController.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Zikr',
        child: const Icon(Icons.add),
      ),
    );
  }
}
