import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../model/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({required this.userTodo});

  final List<Todo> userTodo;

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // final List<Todo> todoList = [Todo(title: "Math HomeWork", description: "Do it now"), Todo(title: "Math HomeWork", description: "Do it now"), Todo(title: "Flutter Assignment", dateTime: DateTime(2001, 08, 02), isCompleted: true), Todo(title: "Flutter Assignment", dateTime: DateTime(2001, 08, 02), isCompleted: true)];
  int currentIndex = 0;
  final List<Todo> taskList = [];

  @override
  void initState() {
    taskList.addAll(widget.userTodo);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "My Task",
          style: GoogleFonts.acme(
            fontSize: 26,
            color: AppColors.primaryText,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appbarColor,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.bottomSheetBgColor,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            // isDismissible: false,
            context: context,
            builder: (context) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text("New Task", style: GoogleFonts.acme(color: AppColors.primaryText, fontSize: 26)),
                          const Spacer(),
                          IconButton(
                            iconSize: 22,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Container(
                              decoration: const BoxDecoration(color: AppColors.cancelIconColor, shape: BoxShape.circle),
                              child: const Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.bgColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      TextField(
                        controller: titleController,
                        style: const TextStyle(color: AppColors.primaryText),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          fillColor: AppColors.inputFieldBgColor,
                          filled: true,
                          hint: Text("Enter Task Title", style: GoogleFonts.roboto(color: AppColors.inputHintTextColor)),
                          label: Text("TITLE", style: GoogleFonts.roboto(color: AppColors.primaryText.withValues(alpha: 0.6))),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.taskCardBorderColor.withValues(alpha: 0.7), width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.taskCardBorderColor, width: 2.0),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: descriptionController,
                        minLines: 4,
                        maxLines: 20,
                        style: const TextStyle(color: AppColors.primaryText),
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          fillColor: AppColors.inputFieldBgColor,
                          filled: true,
                          hint: Text("Enter Description (optional)", style: GoogleFonts.roboto(color: AppColors.inputHintTextColor)),
                          label: Text("DESCRIPTION", style: GoogleFonts.roboto(color: AppColors.primaryText.withValues(alpha: 0.6))),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.taskCardBorderColor.withValues(alpha: 0.7), width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.taskCardBorderColor, width: 2.0),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            if (titleController.text.isNotEmpty) {
                              taskList.add(Todo(title: titleController.text, description: descriptionController.text.isEmpty ? null : descriptionController.text, dateTime: DateTime.now()));
                              setState(() {});
                              Navigator.pop(context);
                            } else {
                              // Fluttertoast.showToast(msg: "Title is required", toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     behavior: SnackBarBehavior.fixed,
                              //     content: Text('Title is Required'),
                              //     backgroundColor: Colors.red,
                              //   ),
                              // );
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBtnColor),
                          child: Text("ADD TASK", style: GoogleFonts.acme(color: AppColors.primaryBtnTextColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: AppColors.fabIconColor),
      ),
      body: taskList.isEmpty
          ? Center(
              child: Lottie.asset(
                AppAssets.noDataAnimation,
              ),
            )
          // Center(
          //         child: Text(
          //           "No Tasks found yet",
          //           style: GoogleFonts.acme(color: AppColors.primaryText, fontSize: 36),
          //         ),
          //       )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final myTodoList = taskList[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: AppColors.taskCardBgColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: (myTodoList.isCompleted ?? false) ? AppColors.taskCardBorderColor.withValues(alpha: 0.5) : AppColors.taskCardBorderColor, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        shape: const CircleBorder(),
                        checkColor: AppColors.bgColor,
                        activeColor: AppColors.activeCheckboxColor,
                        side: const BorderSide(color: AppColors.inactiveCheckboxBorderColor),
                        value: myTodoList.isCompleted,
                        onChanged: (bool? isCheckValue) {
                          setState(() {
                            myTodoList.isCompleted = isCheckValue;
                          });
                        },
                      ),
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: (myTodoList.isCompleted ?? false) ? AppColors.taskCardBorderColor.withValues(alpha: 0.4) : AppColors.taskCardBorderColor,
                        child: CircleAvatar(
                          radius: 34,
                          backgroundColor: AppColors.inactiveCheckboxBorderColor,
                          backgroundImage: index % 2 == 0
                              ? const AssetImage(AppAssets.profilePic)
                              : const NetworkImage(
                                  "https://avatars.githubusercontent.com/u/107749753?v=4",
                                ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myTodoList.title,
                              style: TextStyle(color: (myTodoList.isCompleted ?? false) ? AppColors.completedText : AppColors.primaryText, fontSize: 20, decoration: (myTodoList.isCompleted ?? false) ? TextDecoration.lineThrough : null, decorationColor: AppColors.primaryText.withValues(alpha: 0.5), decorationThickness: 1.2),
                            ),
                            Row(
                              children: [
                                if (myTodoList.description != null) ...[
                                  Expanded(
                                    child: Text(myTodoList.description!, style: const TextStyle(color: AppColors.secondaryText, fontSize: 16)),
                                  ),
                                ],
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Text(myTodoList.dateTime != null ? "${myTodoList.dateTime?.year}/${myTodoList.dateTime?.month}/${myTodoList.dateTime?.day}" : "", style: const TextStyle(color: AppColors.secondaryText, fontSize: 14)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
