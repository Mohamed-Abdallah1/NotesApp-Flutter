import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:phpcourse/api/api_repo.dart';
import 'package:phpcourse/cash_helper.dart';
import 'package:phpcourse/constants/app_colors.dart';

import 'package:phpcourse/model/notes.dart';
import 'package:phpcourse/notes_bloc/getnotes_bloc/getnotes_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home_Page extends StatelessWidget {
  Home_Page({Key? key}) : super(key: key);
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final TextEditingController note_name = TextEditingController(text: "");
  final TextEditingController note_content = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.deepPurple.shade50,
                builder: (context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: [
                        Center(
                            child: Text(
                          "Easy Add Note",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: note_name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            label: Text("Note Header"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: note_content,
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            label: Text("Note Content"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(main_color),

                          ),
                            onPressed: () async{



                            BlocProvider.of<GetnotesBloc>(context).add(AddnoteEvent(note_name: note_name.text, note_content: note_content.text, user_id: await Cash_Helper.get_id()));
                            Navigator.pop(context);
                            BlocProvider.of<GetnotesBloc>(context).add(InitialEvent());
                            note_content.text="";
                            note_name.text="";

                            }, child: Text("Add Note",style: TextStyle(color: Colors.white),)),
                        SizedBox(height: 300,),
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft, //begin of the gradient color
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    main_color,
                    Colors.black,
                    Colors.deepPurpleAccent
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  Text(
                    "welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Dancing",
                        fontSize: 30),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "mohamed",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Dancing"),
                  ),
                  Spacer(),
                  Container(
                    width: 60,
                    height: 60,
                    child: Image(
                      alignment: Alignment.topCenter,
                      image: AssetImage('images/mynotes.png'),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<GetnotesBloc, GetnotesState>(
              builder: (context, state) {
                if (state is SucsessGetnotesState) {
                  print(state.notes[0].notes_content);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 100),
                    child: SmartRefresher(
                      controller: _refreshController,
                      onRefresh: () {
                        BlocProvider.of<GetnotesBloc>(context)
                            .add(InitialEvent());
                      },
                      child: ListView.builder(
                          itemCount: state.notes.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [


                                Container(
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 7,
                                        spreadRadius: 1,
                                        offset: Offset(0, 3),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              state.notes[index].notes_name!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                BlocProvider.of<GetnotesBloc>(context).add(DeleteNoteEvent(note_id: state.notes[index].note_id!));
                                                BlocProvider.of<GetnotesBloc>(context).add(InitialEvent());

                                              },
                                              icon: Icon(
                                                Icons.delete_forever_outlined,
                                                color: Colors.red,
                                              )),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                note_name.text=state.notes[index].notes_name!;
                                                note_content.text = state.notes[index].notes_content!;

                                                showModalBottomSheet(
                                                    context: context,
                                                    backgroundColor: Colors.deepPurple.shade50,
                                                    builder: (context) {
                                                      return Container(
                                                        width: MediaQuery.of(context).size.width,
                                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                                        child: ListView(
                                                          children: [
                                                            Center(
                                                                child: Text(
                                                                  "Easy Add Note",
                                                                  style: TextStyle(
                                                                      fontFamily: "Dancing",
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 40),
                                                                )),
                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                            TextFormField(
                                                              controller: note_name,
                                                              decoration: InputDecoration(
                                                                border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                ),
                                                                label: Text("Note Header"),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            TextFormField(
                                                              controller: note_content,
                                                              maxLines: 3,
                                                              decoration: InputDecoration(
                                                                border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                ),
                                                                label: Text("Note Content"),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            ElevatedButton(
                                                                style: ButtonStyle(
                                                                  backgroundColor: MaterialStateProperty.all(main_color),

                                                                ),
                                                                onPressed: () async{





                                                                  BlocProvider.of<GetnotesBloc>(context).add(UpdateNoteEvent(note_id: state.notes[index].note_id!, note_name: note_name.text, note_content: note_content.text));

                                                                  Navigator.pop(context);
                                                                  BlocProvider.of<GetnotesBloc>(context).add(InitialEvent());
                                                                  note_content.text="";
                                                                  note_name.text="";

                                                                }, child: Text("Add Note",style: TextStyle(color: Colors.white),)),
                                                            SizedBox(height: 300,),
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              },
                                              icon: Icon(
                                                Icons.mode_edit_outline_outlined,
                                                color: Colors.green,
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 20),
                                        child: Text(
                                            state.notes[index].notes_content!),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            );
                          }),
                    ),
                  );
                } else if (state is LoadingGetnotesState) {
                  return Center(
                      child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.white,
                          secondRingColor: Colors.yellow,
                          size: 50));
                } else if (state is GetnotesInitial) {
                  return SizedBox();
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ));
  }
}
