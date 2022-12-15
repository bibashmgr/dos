import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 7.5,
      ),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        color: kLightColor,
        border: const Border(
          left: BorderSide(
            color: kHighPriorityColor,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Finish Design',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: kDarkColor,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Make the design user-friendly',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: kDarkColor,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: isChecked ? kGrayColor : Colors.grey.shade300,
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
