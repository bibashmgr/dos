import 'package:client/providers/task_provider.dart';
import 'package:client/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// constants
import 'package:client/utils/constants.dart';

// screens
import 'package:client/screens/main_screen/sub_screen/create_project.dart';

// components
import 'package:client/components/home/project_card.dart';
import 'package:client/components/home/task_card.dart';

// services
import 'package:client/services/project_service.dart';

// providers
import 'package:client/providers/project_provider.dart';

// helpers
import 'package:client/helpers/color_convertor.dart';
import 'package:client/helpers/icon_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProjectService projectService = ProjectService();
  TaskService taskService = TaskService();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      projectService.getProjects('/projects', context);
      taskService.getTasks('/tasks', context);
    });
  }

  @override
  Widget build(BuildContext context) {
    List projectList = Provider.of<ProjectProvider>(context).projectsInfo;
    List taskList = Provider.of<TaskProvider>(context).tasksInfo;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: projectList.length + 1,
                itemBuilder: ((context, index) {
                  return index == 0
                      ? const CreateProjectCard()
                      : ProjectCard(
                          id: projectList[index - 1].id,
                          title: projectList[index - 1].name,
                          color: HexColor.fromHex(projectList[index - 1].color),
                          icon: getIcon(projectList[index - 1].icon),
                        );
                }),
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
            Column(
              children: taskList
                  .map((task) => TaskCard(
                        title: task?.name,
                        subtitle: '59625',
                        isDone: task?.isDone,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class CreateProjectCard extends StatelessWidget {
  const CreateProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
          ),
          builder: (BuildContext context) {
            return const FractionallySizedBox(
              heightFactor: 0.9,
              child: CreateProject(),
            );
          },
        );
      },
      child: Container(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
