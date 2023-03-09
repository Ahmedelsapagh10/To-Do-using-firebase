// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_firebase/controller/bloc/cubit.dart';
import 'package:todolist_firebase/controller/bloc_login/signcubit.dart';
import 'package:todolist_firebase/shared_prefrence/sharedPreference.dart';
import 'package:todolist_firebase/view/pages/h.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await getEmail();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => SignCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'TO DO',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
                .copyWith(secondary: Colors.white),
          ),
          home: const H()),
    );
  }
}
