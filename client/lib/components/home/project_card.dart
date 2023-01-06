import 'package:flutter/material.dart';

// constants
import 'package:client/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// screens
import 'package:client/screens/main_screen/sub_screen/view_project.dart';

// arguments
// import 'package:client/arguments/view_project_arguments.dart';

class ProjectCard extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final IconData icon;

  const ProjectCard({
    required this.id,
    required this.title,
    required this.color,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ViewProject.routeName,
          // arguments: ViewProjectArguments('123456789'),
        );
      },
      child: Container(
        width: 165,
        height: 165,
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FaIcon(
              icon,
              color: kLightColor,
              size: 22.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: kLightColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 7.5,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: kLightColor,
                      ),
                      child: const Text(
                        '3 Left',
                        style: TextStyle(
                          color: kDarkColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: kLightColor,
                      ),
                      child: const Text(
                        '2 Done',
                        style: TextStyle(
                          color: kDarkColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
