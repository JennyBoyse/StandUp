import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'app_theme.dart';

class SettingsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  SettingsScreen({Key? key, required this.changePage}) : super(key: key);
  final List<Tab> settingsTabs = <Tab>[
    const Tab(text: 'Account'),
    const Tab(text: 'Workday'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
      body: Center(child: Column(children: [const SizedBox(height: 20), Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.15,
        padding: const EdgeInsets.all(16.0),
        child: Column(
                children: [Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.white,
                    border: Border.all(color: AppTheme.blue, width: 4),
                  ),
                  child: const CircleAvatar(radius: 30.0, child: ClipRRect(child: Icon(Icons.person_pin_rounded, color: AppTheme.lightPurple, size:40)), backgroundColor: Colors.transparent),
                ),
                ]),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/images/activity_card_background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop)),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppTheme.darkPurple,
                  AppTheme.lightPurple,
                ],
                tileMode: TileMode.clamp
            )),
      ),
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
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'First Name',
                ),
              ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Email Address',
              ),
            ),
            TextFormField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            TextFormField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Repeat Password',
              ),
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
                backgroundColor: AppTheme.blue,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Save Changes')
                  ]
              ),
              onPressed: (){(Navigator.pop(context));}))]
        )
    ));
  }
}

class WorkdaySettings extends StatefulWidget {
  const WorkdaySettings({Key? key}) : super(key: key);

  @override
  _WorkdaySettingsState createState() => _WorkdaySettingsState();
}

class _WorkdaySettingsState extends State<WorkdaySettings> {
  String _duration = '01:00';
  String _durationResult = '';
  final formKey = new GlobalKey<FormState>();

  void initState() {
    super.initState();
    _duration = '01:00';
    _durationResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _durationResult = _duration;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
        padding: const EdgeInsets.fromLTRB(20,0,20,0),
        child: Form(key: formKey, autovalidateMode: AutovalidateMode.always, child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DateTimePicker(
                type: DateTimePickerType.time,
                initialValue: '09:00',
                timeLabelText: 'Start time',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              DateTimePicker(
                type: DateTimePickerType.time,
                initialValue: '18:00',
                timeLabelText: 'End time',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              DateTimePicker(
                type: DateTimePickerType.time,
                initialValue: '13:00',
                timeLabelText: 'Lunch break',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              DropDownFormField(
                titleText: 'Lunch break duration',
                hintText: 'Please select a duration',
                value: _duration,
                onSaved: (value){
                  setState((){
                    _duration = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _duration = value;
                  });
                },
                dataSource: const [
                  {
                    "display":"30 minutes",
                    "value":"00:30",
                  },
                  {
                    "display":"1 hour",
                    "value":"01:00",
                  },
                  {
                    "display":"1 hour 30 minutes",
                    "value":"01:30",
                  },
                  {
                    "display":"2 hours",
                    "value":"02:00",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Interval',
                ),
              ),
              const SizedBox(height:20),
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
                      backgroundColor: AppTheme.blue,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Save Changes')
                        ]
                    ),
                    onPressed: _saveForm,))]
        ))
    );
  }
}