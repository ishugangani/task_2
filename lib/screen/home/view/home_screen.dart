import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_2/screen/home/controller/home_controller.dart';
import 'package:task_2/screen/home/modal/home_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtTask = TextEditingController();
  TextEditingController txtCate = TextEditingController();
  HomeProvider? HPtrue,HPfalse;

  @override
  Widget build(BuildContext context) {

    HPfalse=Provider.of<HomeProvider>(context,listen: false);
    HPtrue=Provider.of<HomeProvider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff406882),
          title: Text(
            "LET'S DO IT",
            style: GoogleFonts.quicksand(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                AlertDialog(
                  actions: [
                    TextField(
                    controller: txtTask,
                    decoration: InputDecoration(
                        label: Text("Task"),
                        labelStyle: GoogleFonts.quicksand(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                          borderSide: BorderSide(width: 2),
                        )),
                  ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: txtCate,
                      decoration: InputDecoration(
                          label: Text("Category"),
                          labelStyle: GoogleFonts.quicksand(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        HomeModal m1 = HomeModal();
                        m1.cate = txtCate.text;
                        m1.task = txtTask.text;
                        HPtrue!.toDo.add(m1);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "UPDATE",
                        style: GoogleFonts.quicksand(
                            color: Color(0xff406882)),
                      ),
                    ),
                  ],
                );
              },
              icon: Icon(Icons.add),
            )
          ],
          bottom: PreferredSize(
            child: Text(
              "Today,24 April",
              style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            preferredSize: Size(double.infinity, 50),
          ),
        ),
        backgroundColor: Color(0xffB1D0E0),
        body: Column(
          children: [
            Text(
              "ToDo",
              style: GoogleFonts.quicksand(fontSize: 20, letterSpacing: 2),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: HPtrue!.toDo.isEmpty ? Text(" ") : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 10,
                    ),
                    title: Text("${HPtrue!.toDo[index].task}"),
                    subtitle: Text("${HPtrue!.toDo[index].cate}"),
                    trailing: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            HPtrue!.done.add(HPtrue!.toDo[index]);
                          },
                          icon: Icon(Icons.check),
                        ),
                        IconButton(
                          onPressed: () {
                            AlertDialog(
                              actions: [
                                TextField(
                                  controller: txtTask,
                                  decoration: InputDecoration(
                                    label: Text("Task"),
                                    labelStyle: GoogleFonts.quicksand(),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(width: 2),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: txtCate,
                                  decoration: InputDecoration(
                                    label: Text("Category"),
                                    labelStyle: GoogleFonts.quicksand(),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(width: 2),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    HomeModal m1 = HomeModal();
                                    m1.cate = txtCate.text;
                                    m1.task = txtTask.text;
                                    HPtrue!.toDo.add(m1);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "UPDATE",
                                    style: GoogleFonts.quicksand(
                                        color: Color(0xff406882)),
                                  ),
                                ),
                              ],
                            );
                          },
                          icon: Icon(Icons.note_alt_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            HPtrue!.toDo.removeAt(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: HPtrue!.toDo.length,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Done",
              style: GoogleFonts.quicksand(fontSize: 20, letterSpacing: 2),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: HPtrue!.done.isEmpty ? Text(" ") : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${HPtrue!.done[index].task}"),
                    trailing: Text("${HPtrue!.done[index].task}"),
                  );
                },
                itemCount: HPtrue!.done.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
