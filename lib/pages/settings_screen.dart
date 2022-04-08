import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../data/form_data.dart';
import '../data/data_list.dart';
import '../services/firestore_manager.dart';

class SettingsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  SettingsScreen({Key? key, required this.changePage}) : super(key: key);
  final List<Tab> settingsTabs = <Tab>[
    const Tab(text: 'Account'),
    const Tab(text: 'Workday'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          IconButton(
            iconSize: 50,
            icon: Image.asset('assets/images/logo.png'),
            onPressed: (){changePage(AppTheme.HOMEPAGE);},
          )
        ],
        title: const Text("Settings", style: AppTheme.headline,),
        backgroundColor: Colors.transparent, elevation: 0.0,),
      body: Center(child: Column(children: [const SizedBox(height: 20),
        Expanded(child: Scaffold(
            body: Container(
              padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 20),
                  DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Expanded(child: NestedScrollView(
                        scrollDirection: Axis.vertical,
                          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                            SliverToBoxAdapter(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TabBar(
                            labelColor: AppTheme.black,
                            labelStyle: AppTheme.card7,
                            unselectedLabelColor: AppTheme.grey,
                            tabs: settingsTabs,
                          ),
                        ]
                      ))],
                        body: Container(
                            height: 250,
                            decoration: const BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                            ),
                            child: const SizedBox(
                                height: 250,
                                child: TabBarView(
                                    children: <Widget>[
                                      SingleChildScrollView(child: AccountSettings()),
                                      SingleChildScrollView(child: WorkdaySettings()),
                                    ]
                                ))
                        )
                      )))
                ]
              )
            )
              ))
    ]))
    );
  }
}

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(child: Container(
        padding: EdgeInsets.fromLTRB(20,0,20,0),
        child: Column(
          children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Test User',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                readOnly: true,
              ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email Address',
                hintText: '****@gmail.com',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              readOnly: true,
            ),
            TextFormField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
                hintText: '*********',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              readOnly: true,
            ),
            TextFormField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Repeat Password',
                hintText: '*********',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              readOnly: true,
            ),
            SizedBox(height:20),
            SizedBox(
              width: 200,
              height: 40,
              child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(20),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                primary: AppTheme.white,
                textStyle: AppTheme.subtitle,
                backgroundColor: AppTheme.darkGrey,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Save Changes')
                  ]
              ),
              onPressed: (){}
              ),),
            SizedBox(height:10),
            const SizedBox(height: 40, child: Text('Test user: account settings disabled', style: TextStyle(color: Colors.red),))
          ],
        )
    ));
  }
}

class WorkdaySettings extends StatefulWidget {
  const WorkdaySettings ({Key? key}) : super(key: key);

  @override
  _WorkdaySettingsState createState() => _WorkdaySettingsState();
}

class _WorkdaySettingsState extends State<WorkdaySettings> {
  late String _duration;
  late String _interval;
  final emailController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final lunchBreakController = TextEditingController();
  late FirestoreManager prefs;
  late bool setId;

  final formKey = GlobalKey<FormState>();
  late User model = User('standuptestuser',"","","","","","","");
  final _durations = ["00:30", "01:00", "01:30", "02:00",];
  final _intervals = ["00:15", "00:30", "00:45", "01:00",];

  @override
  void initState() {
    super.initState();
    checkUserId();
    _duration = '01:00';
    _interval = '00:30';
  }

  String getUserID(String id) {
    String userID = 'standuptestuser';
    if (id != userID) {
      return id;
    }
    return userID;
  }

  void checkUserId() async {
    prefs = await FirestoreManager.getInstance();
    // setId = (prefs.getBool('userIdSet') ?? true);
    // print(setId);
    // if(setId == false) {
    //   prefs.setString('userId', 'standuptestuser');
    // }
  }

  @override
  Widget build(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_) => UserData.scrollToBottom);

    return Container(
        padding: const EdgeInsets.fromLTRB(20,0,20,0),
        child: Form(key: formKey, autovalidateMode: AutovalidateMode.always, child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'e.g. standuptestuser',
                  border: UnderlineInputBorder(),
                  labelText: 'Test User ID',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onChanged: (val) => print(val),
                validator: (val) {
                  return null;
                },
                onSaved: (val) => model.id = val!,
              ),
              DateTimePicker(
                controller: startTimeController,
                type: DateTimePickerType.time,
                timeLabelText: 'Start time',
                onChanged: (val) => print(val),
                validator: (val) {
                  return null;
                },
                onSaved: (val) => model.startTime = val!,
              ),
              DateTimePicker(
                controller: endTimeController,
                type: DateTimePickerType.time,
                timeLabelText: 'End time',
                onChanged: (val) => print(val),
                validator: (val) {
                  return null;
                },
                onSaved: (val) => model.endTime = val!,
              ),
              DateTimePicker(
                controller: lunchBreakController,
                type: DateTimePickerType.time,
                timeLabelText: 'Lunch break',
                onChanged: (val) => print(val),
                validator: (val) {
                  return null;
                },
                onSaved: (val) => model.lunchBreak = val!,
              ),
              FormField<String>(
                  builder: (FormFieldState<String> state) {
                return InputDecorator(
                    decoration: const InputDecoration(
                        labelText: 'Lunch break duration',
                        hintText: 'Please select a duration',),
                    isEmpty: _duration == '',
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      value: _duration,
                      isDense: true,
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _duration = value!;
                        });
                      },
                      items: _durations.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )));
                  }),
              FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Interval between breaks',
                          hintText: 'Please select an interval',),
                        isEmpty: _interval == '',
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _interval,
                              isDense: true,
                              underline: Container(
                                height: 2,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _interval = value!;
                                });
                              },
                              items: _intervals.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )));
                  }),
              const SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        // print(id_controller.text);

                        Map<String, String> userData = {
                          "email": emailController.text,
                          "startTime": startTimeController.text,
                          "endTime": endTimeController.text,
                          "lunchBreak": lunchBreakController.text,
                          "lunchDuration": _duration,
                          "interval": _interval
                        };
                        prefs.updateOrCreateUser(userData);
                        // prefs.setString('userId',id_controller.text); // update the user ID in local storage
                        // print(prefs.getString('userId'));
                        //model.lunchDuration = _duration;
                        //model.interval = _interval;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(backgroundColor: AppTheme.lightGrey, content: Text('Processing Data...',style:AppTheme.card2)),
                        );
                      }
                    },
                  child: const Text('Save Changes'),
                ),
              )]
        ))
    );
  }
}