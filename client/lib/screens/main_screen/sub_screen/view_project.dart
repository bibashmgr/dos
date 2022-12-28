import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// constants
import 'package:client/utils/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timeline_tile/timeline_tile.dart';

// arguments
// import 'package:client/arguments/view_project_arguments.dart';

class ViewProject extends StatefulWidget {
  const ViewProject({Key? key}) : super(key: key);

  static const routeName = '/project';

  @override
  State<ViewProject> createState() => _ViewProjectState();
}

class _ViewProjectState extends State<ViewProject> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as ViewProjectArguments;
    return Scaffold(
      backgroundColor: kLightColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: kDarkColor,
              statusBarIconBrightness: Brightness.light,
            ),
            pinned: true,
            floating: true,
            expandedHeight: 250,
            backgroundColor: kDarkColor,
            elevation: 0.0,
            centerTitle: true,
            titleSpacing: 0.0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Personal Tasks",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: kLightColor,
                  ),
                ),
                SizedBox(
                  height: 2.5,
                ),
                Text(
                  "You have 3 new tasks for today!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: kLightColor,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.ellipsisVertical,
                  color: kLightColor,
                  size: 22.0,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(175),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15.0,
                ),
                decoration: const BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: TableCalendar(
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
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 30.0,
              ),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return TimelineTile(
                      isFirst: true,
                      indicatorStyle: const IndicatorStyle(
                        width: 20,
                        indicatorXY: 0,
                        color: kUnselectedColor,
                      ),
                      beforeLineStyle: const LineStyle(
                        color: kUnselectedColor,
                      ),
                      endChild: const TaskTile(),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "12:00am",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Column(
            children: const [
              CardForTask(),
            ],
          )
        ],
      ),
    );
  }
}

class CardForTask extends StatefulWidget {
  const CardForTask({Key? key}) : super(key: key);

  @override
  State<CardForTask> createState() => _CardForTaskState();
}

class _CardForTaskState extends State<CardForTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Do Excersie for 30minutes",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: kLightColor,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "09:00am - 10:00am",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: kLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
