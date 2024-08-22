import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'package:zikir_sayar/Notifiers/ZikrProvider.dart';
import 'package:zikir_sayar/generated/l10n.dart';
import 'package:zikir_sayar/pages/list_page/ListPage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:zikir_sayar/widgets/SevenSegmentDisplay.dart';


class Counterpage extends StatefulWidget {
  const Counterpage({super.key});

  @override
  State<Counterpage> createState() => _CounterpageState();
}

class _CounterpageState extends State<Counterpage> {
  int _counter = 0;
  late bool _vibrationEnabled;
  late bool _soundEnabled;
  bool _isInitialized = false;
  Map<String, bool> buttonSizes = {'small': false, 'medium': true, 'large': false, 'very_large': false};
  double _buttonModifier = 0.7;
  double _smallButtonModifier = 4;
  late SharedPreferences prefs;
  AudioPlayer audioPlayer = AudioPlayer();


  /*void _incrementCounter() {
    setState(() {
      _counter++;
      if (_vibrationEnabled) {
        Vibration.vibrate(duration: 200);
      }
      if (_soundEnabled) {
        audioPlayer.play(AssetSource('sounds/soft_typewriter.wav'));
      }
    });
  }*/

  void _incrementCounter() {
    final zikrProvider = Provider.of<ZikrProvider>(context, listen: false);
    zikrProvider.updateZikr(
      zikrName: zikrProvider.selectedZikrName!,
      count: zikrProvider.selectedZikr!['count'] + 1,
    );
    if (_vibrationEnabled) {
      Vibration.vibrate(duration: 200);
    }
    if (_soundEnabled) {
      audioPlayer.play(AssetSource('sounds/soft_typewriter.wav'));
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _toggleVibration() {
    prefs.setBool("vibration_enabled", !_vibrationEnabled);
    setState(() {
      _vibrationEnabled =!_vibrationEnabled;
    });
  }

  void _toggleSound() {
    prefs.setBool("sound_enabled", !_soundEnabled);
    setState(() {
      _soundEnabled =!_soundEnabled;
    });
  }

  void selectSize(String size) {
    prefs.setString("button_size", size);
    buttonSizes.forEach((key, value) => buttonSizes[key] = false);
    buttonSizes[size] = true;
    _updateButtonSize(size);
  }

  void _updateButtonSize(String size) {
    switch (size) {
      case 'small':
        _buttonModifier = 0.5;
        _smallButtonModifier = 5;
        break;
      case 'medium':
        _buttonModifier = 0.7;
        _smallButtonModifier = 4;
        break;
      case 'large':
        _buttonModifier = 0.9;
        _smallButtonModifier = 3;
        break;
      case 'very_large':
        _buttonModifier = 1.2;
        _smallButtonModifier = 2;
        break;
    }
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    _vibrationEnabled = prefs.getBool("vibration_enabled") == null ? true : prefs.getBool("vibration_enabled")!;
    _soundEnabled = prefs.getBool("sound_enabled") == null ? true : prefs.getBool("sound_enabled")!;
    prefs.getString("button_size") == null ? selectSize("normal") :  selectSize(prefs.getString("button_size")!);
  }

  @override
  void initState() {
    super.initState();
    initPrefs().then((_) {
      setState(() {
        _isInitialized = true;
      });
      final zikrProvider = Provider.of<ZikrProvider>(context, listen: false);
      if (zikrProvider.items.isEmpty) {
        zikrProvider.addZikr('Unnamed');
      }
      zikrProvider.selectZikr(zikrProvider.items[0]['name']);
    });
  }

  @override
  Widget build(BuildContext context) {
    final zikrProvider = Provider.of<ZikrProvider>(context);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double svgWidth = deviceWidth * 0.8;
    double svgHeight = deviceHeight * 0.5;
    double buttonSize = deviceWidth * 0.2;
    double smallButtonSize = deviceWidth * 0.1;

    String getEnabledSize() {
      String enabledSize = '';
      buttonSizes.forEach((key, value) {
        if (value) {
          enabledSize = key;
        }
      });
      return enabledSize;
    }

    if (!_isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (zikrProvider.items.isEmpty) {
      zikrProvider.addZikr('Unnamed');
    }

    String currentZikrName = zikrProvider.selectedZikrName?? 'Unnamed';
    zikrProvider.selectZikr(currentZikrName);

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(currentZikrName),
        automaticallyImplyLeading: false,
        actions: [
          Builder(
              builder: (context) {
                return Semantics(
                  label: S.of(context).opensUpDrawer,
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(Icons.menu)
                  ),
                );
              }
          )
        ],
      ),
      endDrawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.green[300],
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Semantics(
                  label: S.of(context).toggleVibrationCurrentIs(_vibrationEnabled.toString()),
                  child: ListTile(
                  onTap: _toggleVibration,
                  contentPadding: const EdgeInsets.all(10),
                  title:Row(
                    children:[
                      const Icon(Icons.vibration),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).vibration,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ) ,
                  trailing: Switch(
                      value: _vibrationEnabled,
                      onChanged: (bool value) {
                        _toggleVibration();
                      }
                  )
                ),
              ),
              Semantics(
                label: S.of(context).toggleSoundCurrentIs(_soundEnabled.toString()),
                child: ListTile(
                    onTap: _toggleSound,
                    contentPadding: const EdgeInsets.all(10),
                    title:Row(
                      children:[
                        const Icon(Icons.volume_up),
                        const SizedBox(width: 10),
                        Text(
                          S.of(context).sound,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ) ,
                    trailing: Switch(
                        value: _soundEnabled,
                        onChanged: (bool value) {
                          _toggleSound();
                        }
                    )
                ),
              ),
              Semantics(
                // label: 'Expand button size tile. Current size is ${getEnabledSize()}',
                label: S.of(context).expandButtonSizeTileCurrentIs(getEnabledSize()),
                child: ExpansionTile(
                  title:Row(
                      children:[
                        const Icon(Icons.straighten),
                        const SizedBox(width: 10),
                        Text(
                          S.of(context).buttonSize,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  children: [
                    for (var entry in buttonSizes.entries)
                      Semantics(
                        // label: entry.key,
                        label: S.of(context).drawerSizeItem(entry.key),
                        child: ListTile(
                          title: Text(S.of(context).drawerSizeItem(entry.key)),
                          trailing: entry.value? const Icon(Icons.check) : const Icon(Icons.close),
                          onTap: () => setState(() => selectSize(entry.key))
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Centered Container for SVG with Aspect Ratio
          Center(
            child: SizedBox(
              width: svgWidth,
              height: svgHeight,
              child: SvgPicture.asset(
                'assets/images/asd2.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Content
          Center(
            child: SizedBox(
              width: svgWidth * 0.55,
              height: svgHeight * 0.75,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Counter Display at the Center
                    /*Center(
                      child: Container(
                        color: Colors.greenAccent,
                        padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                          child: Semantics(
                            label: S.of(context).counterCount(zikrProvider.selectedZikr!['count']),
                              child: SevenSegmentDisplay(value: zikrProvider.selectedZikr!['count']))
                      ),
                    ),*/
                    Center(
                      child: Consumer<ZikrProvider>(
                        builder: (context, zikrProvider, child) {
                          return Container(
                            color: Colors.greenAccent,
                            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                            child: Semantics(
                              label: S.of(context).counterCount(zikrProvider.selectedZikr!['count']),
                              child: SevenSegmentDisplay(value: zikrProvider.selectedZikr!['count']),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: deviceHeight * 0.02), // Space between counter and buttons
                    // Row for the Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Semantics(
                          label: S.of(context).resetCounter,
                          child: ElevatedButton(
                            onPressed: _resetCounter,
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: EdgeInsets.all(smallButtonSize / _smallButtonModifier), // Adjust size dynamically
                              backgroundColor: Colors.redAccent,
                            ),
                            child: const Icon(Icons.refresh, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.02), // Space between small buttons and big button
                    // Large Button at Bottom Center
                    Center(
                      child: Semantics(
                        label: S.of(context).increaseCounter,
                        child: FilledButton(
                          onPressed: () async {
                            _incrementCounter();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.all(buttonSize * _buttonModifier), // Adjust size dynamically
                            backgroundColor: Colors.blueAccent,
                            enableFeedback: false
                          ),
                          child: null
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, deviceHeight * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Semantics(
              label: S.of(context).goToListPage,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Listpage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  S.current.list,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white
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
