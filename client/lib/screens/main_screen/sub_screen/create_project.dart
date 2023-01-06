import 'package:client/helpers/color_convertor.dart';
import 'package:client/services/project_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// utils
import 'package:client/utils/constants.dart';
import 'package:client/utils/projects.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  final List<bool> _iconSelection =
      List<bool>.generate(projectIcons.length, (index) => index == 0);
  Color _colorselection = kRedColor;

  final _formKey = GlobalKey<FormState>();

  String name = '';
  String desc = '';
  String icon = '';
  String color = '';

  ProjectService projectService = ProjectService();

  void createProject() async {
    for (var i = 0; i < _iconSelection.length; i++) {
      if (_iconSelection[i]) {
        setState(() {
          icon = iconNames[i];
        });
      }
    }
    setState(() {
      color = _colorselection.toHex(leadingHashSign: false);
    });

    await projectService.createProject(
        '/projects/create',
        {
          'name': name,
          'desc': desc,
          'icon': icon,
          'color': color,
        },
        context);

    closeBottomSheet();
  }

  void closeBottomSheet() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
          "Create new project",
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
            vertical: 15.0,
          ),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              hintText: 'Name',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
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
                      height: 15.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Icon',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: kDarkColor,
                            ),
                          ),
                          const SizedBox(
                            height: 7.5,
                          ),
                          ToggleButtons(
                            isSelected: _iconSelection,
                            onPressed: (int index) {
                              setState(() {
                                for (int i = 0;
                                    i < _iconSelection.length;
                                    i++) {
                                  _iconSelection[i] = i == index;
                                }
                              });
                            },
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            selectedBorderColor: kDarkColor,
                            color: kDarkColor,
                            fillColor: Colors.transparent,
                            selectedColor: kDarkColor,
                            children: projectIcons,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: kDarkColor,
                            ),
                          ),
                          const SizedBox(
                            height: 7.5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 37.5,
                                height: 37.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: _colorselection,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Pick Color'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: _colorselection,
                                          onColorChanged: (Color color) {
                                            setState(() {
                                              _colorselection = color;
                                            });
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text('DONE'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                    Colors.grey.shade200,
                                  ),
                                ),
                                child: const Text(
                                  'Choose',
                                  style: TextStyle(
                                    color: kDarkColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
              createProject();
            }
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              kDarkColor,
            ),
          ),
          child: const Text(
            'Create project',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: kLightColor,
            ),
          ),
        ),
      ),
    );
  }
}
