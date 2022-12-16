import 'package:client/components/home/task_card.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

// constants
import 'package:client/utils/constants.dart';

// components
import 'package:client/components/home/project_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 25.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: kDarkColor,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 165,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 165,
                    height: 175,
                    margin: const EdgeInsets.only(
                      right: 5.0,
                    ),
                    decoration: BoxDecoration(
                      color: kLightColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(25),
                      dashPattern: const [10, 10],
                      color: Colors.grey.shade500,
                      strokeWidth: 2,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.grey.shade500,
                              size: 16.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const ProjectCard(),
                  const ProjectCard(),
                  const ProjectCard(),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              'Tasks',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: kDarkColor,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const TaskCard(),
            const TaskCard(),
            const TaskCard(),
            const TaskCard(),
          ],
        ),
      ),
    );
  }
}
