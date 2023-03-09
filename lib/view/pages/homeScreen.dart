import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_firebase/controller/bloc/cubit.dart';
import 'package:todolist_firebase/controller/bloc/state.dart';
import 'package:todolist_firebase/view/pages/signinscreen.dart';
import 'package:todolist_firebase/view/widgets/Dialog.dart';
import 'package:todolist_firebase/view/widgets/items.dart';

import '../../constants.dart';
import '../../shared_prefrence/sharedPreference.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.email, super.key});
  String? email;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getEmail();
    widget.email = user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, snapshot) {
      var controller = BlocProvider.of<HomeCubit>(context);

      return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: bacColor,
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return MyDialog(
                  context2: context,
                  id: widget.email!,
                );
              },
            );
          },
          label: const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 16,
              color: txColor,
            ),
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: tx2Color,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                final sharedpref = await SharedPreferences.getInstance();
                sharedpref.remove('user');
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              },
            ),
          ],
          elevation: 0,
          backgroundColor: bacColor,
          centerTitle: true,
          title: const Text(
            'To Do',
            style: TextStyle(color: txColor, fontSize: 22),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: controller.docReference
                .orderBy(kCreatedAt, descending: true)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      if (snapshot.data!.docs[index]['email'] == user) {
                        return MyItem(
                            onPressed: () {
                              controller.deleteNote(
                                  snapshot.data!.docs[index].id.toString());
                            },
                            time: snapshot.data!.docs[index]['time'].toString(),
                            date: snapshot.data!.docs[index]['date'].toString(),
                            task:
                                snapshot.data!.docs[index]['task'].toString());
                      }
                      return Container();
                    });
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data! as Map<String, dynamic>;
                return Text("task is : ${data['task']}");
              }

              return const Center(child: Text("loading"));
            }),
      );
    });
  }
}
