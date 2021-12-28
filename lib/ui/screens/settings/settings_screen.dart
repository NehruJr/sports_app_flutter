import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_application/ui/widgets/custom_appbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = '/user_settings_screen';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const SettingsScreen(),
        settings: const RouteSettings(name: SettingsScreen.routeName));
  }

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool footballIsMain = false;
  bool basketballIsMain = false;
  bool alwaysAsk = true;
  savePref(footballIsMain, basketballIsMain, alwaysAsk) async {
    SharedPreferences setPreferences = await SharedPreferences.getInstance();
    setPreferences.setBool('football', footballIsMain);
    setPreferences.setBool('basketball', basketballIsMain);
    setPreferences.setBool('alwaysAsk', alwaysAsk);
    print('$footballIsMain , $basketballIsMain , $alwaysAsk');
  }

  getPreferences() async {
    SharedPreferences getPreferences = await SharedPreferences.getInstance();
    setState(() {
      footballIsMain = (getPreferences.getBool('football') ?? false);
      basketballIsMain = (getPreferences.getBool('basketball') ?? false);
      alwaysAsk = (getPreferences.getBool('alwaysAsk') ?? true);
    });
  }

  @override
  void initState() {
    getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getPreferences();
    });
    return Scaffold(
      appBar: CustomAppBar(
        screenName: ' User Settings',
        color: Colors.black,
        actions: const [Icon(Icons.search)],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Football as main screen',
                      style: Theme.of(context).textTheme.headline5),
                  Switch.adaptive(
                      value: footballIsMain,
                      onChanged: (bool newValue) {
                        setState(() {
                          footballIsMain = newValue;
                          if (newValue == true) {
                            basketballIsMain = !footballIsMain;
                            alwaysAsk = !footballIsMain;
                          } else {
                            basketballIsMain = footballIsMain;
                            alwaysAsk = true;
                          }
                          setState(() {
                            savePref(
                                footballIsMain, basketballIsMain, alwaysAsk);
                          });
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Basketball as my main screen',
                      style: Theme.of(context).textTheme.headline5),
                  Switch.adaptive(
                      value: basketballIsMain,
                      onChanged: (bool newValue) {
                        setState(() {
                          basketballIsMain = newValue;
                          if (newValue == true) {
                            alwaysAsk = !basketballIsMain;
                            footballIsMain = !basketballIsMain;
                          } else {
                            alwaysAsk = true;
                            footballIsMain = false;
                          }
                          setState(() {
                            savePref(
                                footballIsMain, basketballIsMain, alwaysAsk);
                          });
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Always Ask Me',
                      style: Theme.of(context).textTheme.headline5),
                  Switch.adaptive(
                      value: alwaysAsk,
                      onChanged: (bool newValue) {
                        setState(() {
                          alwaysAsk = newValue;
                          if (newValue == true) {
                            basketballIsMain = !alwaysAsk;
                            footballIsMain = !alwaysAsk;
                          } else {
                            basketballIsMain = false;
                            footballIsMain = true;
                          }
                          setState(() {
                            savePref(
                                footballIsMain, basketballIsMain, alwaysAsk);
                          });
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
