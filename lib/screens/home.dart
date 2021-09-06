import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/logic/global_variables.dart';
import 'package:taskaty/models/task.dart';
import 'package:taskaty/providers/data_validation_provider.dart';
import 'package:taskaty/providers/user_provider.dart';
import 'package:taskaty/widgets/bottom_bar.dart';
import 'package:taskaty/widgets/circular_progress_bar.dart';
import 'package:taskaty/widgets/task_card.dart';
import 'package:taskaty/providers/task_provider.dart';

class Home extends StatelessWidget {
  final new_task_title_controller = TextEditingController();
  final new_task_duedate_controller = TextEditingController();
  final new_task_description_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////////
    double pic_size = Global_Variables.getDeviceWidth(context) / 5;
    double icon_size = Global_Variables.getDeviceWidth(context) / 5;
    double name_font_size = Global_Variables.getDeviceWidth(context) / 15;
    double empty_tasks_padding = Global_Variables.getDeviceWidth(context) / 1.1;
    double alert_height = Global_Variables.getDeviceHeight(context) / 1.5;
    double alert_components_spaces =
        Global_Variables.getDeviceHeight(context) / 31;

    List<Task> tasks_list = Provider.of<Task_Provider>(context).mytasks;
    int total_number_of_tasks = tasks_list.length;
    int finished_tasks = 0;

    //////////////////////////////////////////////////
    return Scaffold(
        //bottom bar
        bottomNavigationBar: Bottom_Bar(),
        floatingActionButton: Container(
          height: icon_size,
          width: icon_size,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 10,
              onPressed: () {
                Provider.of<Data_Validation_Provider>(context, listen: false)
                    .onNewTaskRestore();
                showDialog(
                    context: context,
                    builder: (BuildContext context) => SingleChildScrollView(
                          child: AlertDialog(
                            title: Text(
                              "Create New Task",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Global_Variables.grey,
                            content: Container(
                              height: alert_height,
                              color: Global_Variables.grey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Divider(color: Colors.white),
                                    SizedBox(height: alert_components_spaces),
                                    TextField(
                                      controller: new_task_title_controller,
                                      decoration: InputDecoration(
                                        errorText: Provider.of<
                                                        Data_Validation_Provider>(
                                                    context,
                                                    listen: false)
                                                .new_task_title_validate
                                            ? Provider.of<
                                                        Data_Validation_Provider>(
                                                    context)
                                                .new_task_title_text
                                            : null,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Global_Variables.orange,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Global_Variables.orange,
                                          ),
                                        ),
                                        labelText: 'Task title',
                                        hintText: 'Enter title',
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Global_Variables.orange,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: alert_components_spaces),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_today_sharp,
                                          color: Global_Variables.orange,
                                          size: icon_size / 2.4,
                                        ),
                                        SizedBox(width: 10),
                                        SizedBox(
                                          width:
                                              Global_Variables.getDeviceWidth(
                                                      context) /
                                                  2.8,
                                          height: icon_size / 1.5,
                                          child: TextFormField(
                                            readOnly: true,
                                            controller:
                                                new_task_duedate_controller,
                                            onTap: () => {
                                              DatePicker.showDatePicker(context,
                                                  theme: DatePickerTheme(
                                                      backgroundColor:
                                                          Global_Variables.grey,
                                                      cancelStyle: TextStyle(
                                                        color: Global_Variables
                                                            .light_grey,
                                                      ),
                                                      doneStyle: TextStyle(
                                                        color: Global_Variables
                                                            .orange,
                                                      ),
                                                      itemStyle: TextStyle(
                                                        color: Global_Variables
                                                            .orange,
                                                      )),
                                                  showTitleActions: true,
                                                  minTime: DateTime.now(),
                                                  maxTime:
                                                      DateTime(2080, 12, 1),
                                                  onChanged: (date) {
                                                String dateStr =
                                                    "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                                                Provider.of<Data_Validation_Provider>(
                                                        context,
                                                        listen: false)
                                                    .onNewTaskDueDateChosen(
                                                        dateStr);
                                              }, onConfirm: (date) {
                                                String dateStr =
                                                    "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                                                Provider.of<Data_Validation_Provider>(
                                                        context,
                                                        listen: false)
                                                    .onNewTaskDueDateChosen(
                                                        dateStr);
                                              },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.en),
                                            },
                                            cursorColor: Colors.white,
                                            decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText: Provider.of<
                                                          Data_Validation_Provider>(
                                                      context)
                                                  .new_title_duedate,
                                              hintStyle: TextStyle(
                                                color:
                                                    Global_Variables.light_grey,
                                                fontSize: name_font_size / 1.2,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Global_Variables.orange,
                                          size: icon_size / 3,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: alert_components_spaces),
                                    TextField(
                                      maxLines: 4,
                                      controller:
                                          new_task_description_controller,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Global_Variables.orange,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Global_Variables.orange,
                                          ),
                                        ),
                                        labelText: 'Task Description',
                                        hintText: 'Enter description',
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Global_Variables.orange,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: alert_components_spaces),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Color",
                                          style: TextStyle(
                                              fontSize: name_font_size / 1.2,
                                              color:
                                                  Global_Variables.light_grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: alert_components_spaces / 2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () => {
                                            Provider.of<Data_Validation_Provider>(
                                                    context,
                                                    listen: false)
                                                .onNewTaskColorChange(
                                                    Colors.red)
                                          },
                                          child: Container(
                                            width: icon_size / 2.5,
                                            height: icon_size / 2.5,
                                            decoration: BoxDecoration(
                                                border:
                                                    Provider.of<Data_Validation_Provider>(
                                                                    context)
                                                                .new_title_color ==
                                                            Colors.red
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 2)
                                                        : null,
                                                color: Colors.red,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => {
                                            Provider.of<Data_Validation_Provider>(
                                                    context,
                                                    listen: false)
                                                .onNewTaskColorChange(
                                                    Colors.green)
                                          },
                                          child: Container(
                                            width: icon_size / 2.5,
                                            height: icon_size / 2.5,
                                            decoration: BoxDecoration(
                                                border:
                                                    Provider.of<Data_Validation_Provider>(
                                                                    context)
                                                                .new_title_color ==
                                                            Colors.green
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 2)
                                                        : null,
                                                color: Colors.green,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => {
                                            Provider.of<Data_Validation_Provider>(
                                                    context,
                                                    listen: false)
                                                .onNewTaskColorChange(
                                                    Colors.yellow)
                                          },
                                          child: Container(
                                            width: icon_size / 2.5,
                                            height: icon_size / 2.5,
                                            decoration: BoxDecoration(
                                                border:
                                                    Provider.of<Data_Validation_Provider>(
                                                                    context)
                                                                .new_title_color ==
                                                            Colors.yellow
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 2)
                                                        : null,
                                                color: Colors.yellow,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => {
                                            Provider.of<Data_Validation_Provider>(
                                                    context,
                                                    listen: false)
                                                .onNewTaskColorChange(
                                                    Colors.blue)
                                          },
                                          child: Container(
                                            width: icon_size / 2.5,
                                            height: icon_size / 2.5,
                                            decoration: BoxDecoration(
                                                border:
                                                    Provider.of<Data_Validation_Provider>(
                                                                    context)
                                                                .new_title_color ==
                                                            Colors.blue
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 2)
                                                        : null,
                                                color: Colors.blue,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => {
                                            Provider.of<Data_Validation_Provider>(
                                                    context,
                                                    listen: false)
                                                .onNewTaskColorChange(
                                                    Colors.pink)
                                          },
                                          child: Container(
                                            width: icon_size / 2.5,
                                            height: icon_size / 2.5,
                                            decoration: BoxDecoration(
                                                border:
                                                    Provider.of<Data_Validation_Provider>(
                                                                    context)
                                                                .new_title_color ==
                                                            Colors.pink
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 2)
                                                        : null,
                                                color: Colors.pink,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => {
                                            Provider.of<Data_Validation_Provider>(
                                                    context,
                                                    listen: false)
                                                .onNewTaskColorChange(
                                                    Colors.deepPurple)
                                          },
                                          child: Container(
                                            width: icon_size / 2.5,
                                            height: icon_size / 2.5,
                                            decoration: BoxDecoration(
                                                border:
                                                    Provider.of<Data_Validation_Provider>(
                                                                    context)
                                                                .new_title_color ==
                                                            Colors.deepPurple
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 2)
                                                        : null,
                                                color: Colors.deepPurple,
                                                shape: BoxShape.circle),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: alert_components_spaces),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Remind Me",
                                          style: TextStyle(
                                              fontSize: name_font_size / 1.2,
                                              color:
                                                  Global_Variables.light_grey),
                                        ),
                                        Switch(
                                          value: Provider.of<
                                                      Data_Validation_Provider>(
                                                  context)
                                              .new_title_remindme,
                                          onChanged: (value) {
                                            Provider.of<Data_Validation_Provider>(
                                                    context,
                                                    listen: false)
                                                .onNewTaskReminMe(value);
                                          },
                                          activeTrackColor:
                                              Global_Variables.dark_orange,
                                          activeColor: Global_Variables.orange,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: alert_components_spaces),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text('Cancel',
                                      style: TextStyle(
                                          fontSize: name_font_size / 1.5,
                                          color: Global_Variables.light_grey)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                              FlatButton(
                                  child: Text('Ok',
                                      style: TextStyle(
                                          fontSize: name_font_size / 1.5,
                                          color: Global_Variables.orange)),
                                  onPressed: () {
                                    if (new_task_title_controller.text == "") {
                                      Provider.of<Data_Validation_Provider>(
                                              context,
                                              listen: false)
                                          .onNewTaskTitleEmpty();
                                    } else {
                                      Provider.of<Data_Validation_Provider>(
                                              context,
                                              listen: false)
                                          .onNewTaskTitleNoEmpty();
                                      Provider.of<Data_Validation_Provider>(
                                              context,
                                              listen: false)
                                          .onNewTaskRestore();

                                      Provider.of<Task_Provider>(context,
                                              listen: false)
                                          .addTask(
                                              "1",
                                              new_task_title_controller.text,
                                              Provider.of<Data_Validation_Provider>(
                                                      context)
                                                  .new_title_duedate,
                                              new_task_description_controller
                                                  .text,
                                              false,
                                              Provider.of<Data_Validation_Provider>(
                                                      context)
                                                  .new_title_color,
                                              Provider.of<Data_Validation_Provider>(
                                                      context)
                                                  .new_title_remindme);
                                      Navigator.of(context).pop();
                                    }
                                  })
                            ],
                          ),
                        ));
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Global_Variables.dark_orange,
            ),
          ),
        ),
        body: Container(
            color: Global_Variables.grey,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: pic_size,
                          height: pic_size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/profile.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Text(
                          "Welcome back " +
                              Provider.of<User_Provider>(context).user.name +
                              "!",
                          style: TextStyle(
                            fontSize: name_font_size,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    new Cricular_Brogress_Bar(
                        total_number_of_tasks, finished_tasks),
                    tasks_list.isEmpty
                        ? SizedBox(
                            height: empty_tasks_padding,
                            child: Center(
                                child: Text('No Tasks Added',
                                    style: TextStyle(
                                        fontSize: name_font_size,
                                        color: Colors.white))),
                          )
                        : ListView(
                            children: tasks_list
                                .map(
                                  (item) =>
                                      Builder(builder: (ctx) => Task_Card()),
                                )
                                .toList(),
                          ),
                  ],
                ),
              ),
            ))));
  }
}
