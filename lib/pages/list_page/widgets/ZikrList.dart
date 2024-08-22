import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikir_sayar/Notifiers/ZikrProvider.dart';

class Zikrlist extends StatefulWidget {
  const Zikrlist({super.key});

  @override
  State<Zikrlist> createState() => _ZikrlistState();
}

class _ZikrlistState extends State<Zikrlist> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZikrProvider>(
      builder: (context, zikrProvider, child) {
        if (zikrProvider.items.length == 0) {
          return Text("No items");
        } else {
          return ListView.builder(
            itemCount: zikrProvider.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  zikrProvider.items[index]['name'],
                  style: TextStyle(fontSize: 24),
                ),
                subtitle: Text(zikrProvider.items[index]['count'].toString()),
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
                            _nameController.text = zikrProvider.items[index]['name'];
                            final _countController = TextEditingController();
                            _countController.text = zikrProvider.items[index]['count'].toString();
                            return AlertDialog(
                              title: Text('Update Zikr'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Zikr Name',
                                    ),
                                  ),
                                  TextField(
                                    controller: _countController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Zikr Count',
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    zikrProvider.updateZikr(
                                      zikrName: zikrProvider.items[index]['name'],
                                      count: int.parse(_countController.text),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Update'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        zikrProvider.removeZikr(zikrProvider.items[index]['name']);
                        zikrProvider.selectZikr(zikrProvider.items[0]['name']);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        zikrProvider.selectZikr(zikrProvider.items[index]['name']);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                onTap: () {
                  zikrProvider.selectZikr(zikrProvider.items[index]['name']);
                  Navigator.of(context).pop();
                },
              );
            },
          );
        }
      },
    );
  }
}
