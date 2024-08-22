import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikir_sayar/Notifiers/ZikrProvider.dart';
import 'package:zikir_sayar/generated/l10n.dart';
import 'package:zikir_sayar/pages/list_page/widgets/ZikrList.dart';

class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final zikrProvider = Provider.of<ZikrProvider>(context);

    void addZikr(String name){
      zikrProvider.addZikr(name);
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
                title: Text(S.of(context).addDhikr),
                content: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: S.of(context).enterDhikrName,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      addZikr(_nameController.text);
                      _nameController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).add),
                  ),
                ],
              );
            },
          );
        },
        tooltip: S.of(context).addDhikr,
        child: const Icon(Icons.add),
      ),
    );
  }
}

