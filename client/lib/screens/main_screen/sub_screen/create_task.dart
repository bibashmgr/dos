import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

// utils
import 'package:client/utils/constants.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  TimeOfDay sTime = const TimeOfDay(hour: 6, minute: 0);
  TimeOfDay eTime = const TimeOfDay(hour: 18, minute: 0);
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();

  bool isNotify = false;

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

  String displayTime(hr, min) {
    return "${hr < 10 ? '0$hr' : hr}:${min < 10 ? '0$min' : min}";
  }

  @override
  void initState() {
    startTime.text = displayTime(sTime.hour, sTime.minute);
    endTime.text = displayTime(eTime.hour, eTime.minute);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 15.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.xmark,
                    color: kDarkColor,
                    size: 24.0,
                  ),
                ),
                const Text(
                  "Create new task",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                    color: kDarkColor,
                  ),
                ),
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
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 1, 1),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.week,
              rowHeight: 65,
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
                  fontSize: 16.0,
                ),
                weekendStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
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
                children: const [
                  Text(
                    'Task Name',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: kDarkColor,
                    ),
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                children: const [
                  Text(
                    'Task Description',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: kDarkColor,
                    ),
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  TextField(
                    scrollPadding: EdgeInsets.only(bottom: 40),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
