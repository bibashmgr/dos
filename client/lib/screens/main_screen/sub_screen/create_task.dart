import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

// utils
import 'package:client/utils/constants.dart';

// providers
import 'package:client/providers/project_provider.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CreateTask extends StatefulWidget {
  final List<ProjectInfo> projectList;

  const CreateTask({
    required this.projectList,
    Key? key,
  }) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  TimeOfDay sTime = const TimeOfDay(hour: 6, minute: 0);
  TimeOfDay eTime = const TimeOfDay(hour: 18, minute: 0);
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();

  Future displayStartTime(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: sTime);

    if (time != null) {
      setState(() {
        sTime = TimeOfDay(hour: time.hour, minute: time.minute);
        startTime.text = displayTime(time.hour, time.minute);
      });
    }
  }

  Future displayEndTime(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: eTime);

    if (time != null) {
      setState(() {
        eTime = TimeOfDay(hour: time.hour, minute: time.minute);
        endTime.text = displayTime(time.hour, time.minute);
      });
    }
  }

  // helper for displaying time
  String displayTime(hr, min) {
    return "${hr < 10 ? '0$hr' : hr}:${min < 10 ? '0$min' : min}";
  }

  String name = '';
  String desc = '';
  String projectId = '';
  bool isNotify = false;

  void createTask() async {
    // ignore: avoid_print
    print(
        '$_selectedDay, $name, $desc, $projectId, ${startTime.text}, ${endTime.text}, $isNotify');
  }

  @override
  void initState() {
    super.initState();

    projectId = widget.projectList[0].id;
    startTime.text = displayTime(sTime.hour, sTime.minute);
    endTime.text = displayTime(eTime.hour, eTime.minute);
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kLightColor,
        centerTitle: true,
        elevation: 0.0,
        toolbarHeight: 75,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(
            FontAwesomeIcons.xmark,
            color: kDarkColor,
            size: 24.0,
          ),
        ),
        title: const Text(
          "Create new task",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
            color: kDarkColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: kDarkColor,
              size: 22.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kLightColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 0.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 1, 1),
                  focusedDay: _focusedDay,
                  calendarFormat: CalendarFormat.week,
                  rowHeight: 60,
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                    weekendStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  calendarStyle: const CalendarStyle(
                    defaultTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                    weekendTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                    holidayTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                    outsideTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                    withinRangeTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                    disabledTextStyle: TextStyle(
                      color: Color(0xFFBFBFBF),
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                    todayTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                    todayDecoration: BoxDecoration(),
                    selectedTextStyle: TextStyle(
                      color: kLightColor,
                      fontSize: 16.0,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: kDarkColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kDarkColor,
                        ),
                      ),
                      const SizedBox(
                        height: 7.5,
                      ),
                      TextFormField(
                        onSaved: (newValue) => setState(() {
                          name = newValue!;
                        }),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          hintText: 'Name',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kDarkColor,
                        ),
                      ),
                      const SizedBox(
                        height: 7.5,
                      ),
                      TextFormField(
                        onSaved: (newValue) => setState(() {
                          desc = newValue!;
                        }),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter description';
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          hintText: 'Description',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Project',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: kDarkColor,
                        ),
                      ),
                      const SizedBox(
                        height: 7.5,
                      ),
                      DropdownButtonFormField(
                        value: projectId,
                        elevation: 0,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            projectId = value!;
                          });
                        },
                        items: widget.projectList
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.id,
                            child: Text(value.name),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Start Time',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: kDarkColor,
                            ),
                          ),
                          const SizedBox(
                            height: 7.5,
                          ),
                          SizedBox(
                            width: deviceWidth / 2.5,
                            child: TextField(
                              readOnly: true,
                              controller: startTime,
                              onTap: () => displayStartTime(context),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'End Time',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: kDarkColor,
                            ),
                          ),
                          const SizedBox(
                            height: 7.5,
                          ),
                          SizedBox(
                            width: deviceWidth / 2.5,
                            child: TextField(
                              readOnly: true,
                              controller: endTime,
                              onTap: () => displayEndTime(context),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Get alert for this task',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Switch(
                          value: isNotify,
                          activeColor: kDarkColor,
                          onChanged: (bool value) {
                            setState(() {
                              isNotify = value;
                            });
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: kLightColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        margin: const EdgeInsets.only(
          bottom: 15.0,
        ),
        width: double.maxFinite,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState?.save();
              createTask();
            }
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(kDarkColor),
          ),
          child: const Text(
            'Create task',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
