import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikir_sayar/Notifiers/ZikrProvider.dart';
import 'package:zikir_sayar/generated/l10n.dart';

class Zikrlist extends StatefulWidget {
  const Zikrlist({super.key});

  @override
  State<Zikrlist> createState() => _ZikrlistState();
}

class _ZikrlistState extends State<Zikrlist> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZikrProvider>(
      builder: (context, zikr, _) {
        if (zikr.items.length == 0) {
          return Text(S.of(context).noItems);
        } else {
          return ListView.builder(
            itemCount: zikr.items.length,
            itemBuilder: (context, index) {
              return Semantics(
                label: S.of(context).counterBlaBla(zikr.items[index]['count'], zikr.items[index]['name']),
                child: ListTile(
                  title: Text(
                    zikr.items[index]['name'],
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Text(zikr.items[index]['count'].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              final _nameController = TextEditingController();
                              _nameController.text = zikr.items[index]['name'];
                              final _countController = TextEditingController();
                              _countController.text = zikr.items[index]['count'].toString();
                              return AlertDialog(
                                title: Text(S.of(context).updateDhikr),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).enterDhikrName,
                                      ),
                                    ),
                                    TextField(
                                      controller: _countController,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).enterDhikrCount,
                                      ),
                                    ),
                                  ],
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
                                      zikr.updateZikr(
                                        zikrName: zikr.items[index]['name'],
                                        count: int.parse(_countController.text),
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(S.of(context).update),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      (zikr.items.length > 1) ? (
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              zikr.removeZikr(zikr.items[index]['name']);
                            },
                          )
                      ): Text(""),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          zikr.selectZikr(zikr.items[index]['name']);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    zikr.selectZikr(zikr.items[index]['name']);
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
