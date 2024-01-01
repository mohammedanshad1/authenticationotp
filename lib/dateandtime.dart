/*
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';

void main() => runApp(const MyApp());

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(this.currentTime.hour);
    setMiddleIndex(this.currentTime.minute);
    setRightIndex(this.currentTime.second);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
        currentLeftIndex(), currentMiddleIndex(), currentRightIndex())
        : DateTime(currentTime.year, currentTime.month, currentTime.day,
        currentLeftIndex(), currentMiddleIndex(), currentRightIndex());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datetime Picker'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2019, 6, 7),
                      theme: const DatePickerThemeBdaya(
                        headerColor: Colors.orange,
                        backgroundColor: Colors.blue,
                        itemStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        doneStyle: TextStyle(color: Colors.white, fontSize: 16),
                      ), onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: const Text(
                  'show date picker(custom theme &date time range)',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showTimePicker(context,
                      showTitleActions: true, onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      }, currentTime: DateTime.now());
                },
                child: const Text(
                  'show time picker',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showTime12hPicker(context,
                      showTitleActions: true, onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      }, currentTime: DateTime.now());
                },
                child: const Text(
                  'show 12H time picker with AM/PM',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2020, 5, 5, 20, 50),
                      maxTime: DateTime(2020, 6, 7, 05, 09), onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      }, locale: LocaleType.zh);
                },
                child: const Text(
                  'show date time picker (Chinese)',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showDateTimePicker(context,
                      showTitleActions: true, onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      }, currentTime: DateTime(2008, 12, 31, 23, 12, 34));
                },
                child: const Text(
                  'show date time picker (English-America)',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showDateTimePicker(context,
                      showTitleActions: true, onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      },
                      currentTime: DateTime(2008, 12, 31, 23, 12, 34),
                      locale: LocaleType.nl);
                },
                child: const Text(
                  'show date time picker (Dutch)',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showDateTimePicker(context,
                      showTitleActions: true, onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      },
                      currentTime: DateTime(2008, 12, 31, 23, 12, 34),
                      locale: LocaleType.ru);
                },
                child: const Text(
                  'show date time picker (Russian)',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showDateTimePicker(context,
                      showTitleActions: true, onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      },
                      currentTime: DateTime.utc(2019, 12, 31, 23, 12, 34),
                      locale: LocaleType.de);
                },
                child: const Text(
                  'show date time picker in UTC (German)',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: () {
                  DatePickerBdaya.showPicker(context, showTitleActions: true,
                      onChanged: (date) {
                        debugPrint(
                            'change $date in time zone ${date.timeZoneOffset.inHours}');
                      }, onConfirm: (date) {
                        debugPrint('confirm $date');
                      },
                      pickerModel: CustomPicker(currentTime: DateTime.now()),
                      locale: LocaleType.en);
                },
                child: const Text(
                  'show custom time picker,\nyou can custom picker model like this',
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FlutterLogo(size: 100),
              const SizedBox(height: 20),
              const Text('DateField package showcase'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text('DateTimeField'),
              ),
              DateTimeField(
                  decoration: const InputDecoration(
                      hintText: 'Please select your birthday date and time'),
                  selectedDate: selectedDate,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedDate = value;
                    });
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text('DateTimeFormField'),
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    DateTimeFormField(),
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'My Super Date Time Field',
                      ),
                      firstDate: DateTime.now().add(const Duration(days: 10)),
                      lastDate: DateTime.now().add(const Duration(days: 40)),
                      initialDate: DateTime.now().add(const Duration(days: 20)),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (DateTime? e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
                    ),
                    const SizedBox(height: 50),
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Only time',
                      ),
                      mode: DateTimeFieldPickerMode.time,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (DateTime? e) {
                        return (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null;
                      },
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}