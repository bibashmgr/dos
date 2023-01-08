import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isDone;

  const TaskCard({
    required this.title,
    required this.subtitle,
    required this.isDone,
    Key? key,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 7.5,
      ),
      decoration: BoxDecoration(
        color: kLightColor,
        border: const Border(
          left: BorderSide(
            color: kRedColor,
            width: 10.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2.5,
            blurRadius: 2.5,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: isChecked ? kInactiveColor : kDarkColor,
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: isChecked ? 5.0 : 0.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                    color: isChecked ? kInactiveColor : kDarkColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isChecked ? Colors.grey.shade400 : Colors.grey.shade200,
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            width: 24,
            height: 24,
            child: Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.transparent,
              ),
              child: Checkbox(
                activeColor: Colors.transparent,
                checkColor: kLightColor,
                value: isChecked,
                tristate: false,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
