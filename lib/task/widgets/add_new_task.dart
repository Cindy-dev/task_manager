import 'package:flutter/material.dart';
import 'package:task_manager/task/utilities/task_strings/add_task_strings.dart';
import 'package:task_manager/utilities/app_constants/app_colors.dart';
import 'package:task_manager/utilities/device_size.dart';

import '../../utilities/app_constants/app_strings.dart';

Future<dynamic> addNewTask(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.horizontal_rule,
                        size: 100,
                        color: AppColors.gray,
                      )),
                  const Text(
                    AddTaskStrings.heading,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppStrings.fontName,
                    ),
                  ),
                  ListTile(
                    leading: new Icon(Icons.photo),
                    title: new Text('Photo'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.videocam),
                    title: new Text('Video'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.share),
                    title: new Text('Share'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
