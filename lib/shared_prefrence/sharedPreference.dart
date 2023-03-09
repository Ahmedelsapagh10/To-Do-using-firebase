import 'package:shared_preferences/shared_preferences.dart';

String? user;
Future setEmail() async {
  final sharedpref = await SharedPreferences.getInstance();
  await sharedpref.setString('user', user!);
  print(' U add value to user');
}

Future getEmail() async {
  try {
    final sharedpref = await SharedPreferences.getInstance();
    user = sharedpref.getString('user')!;
    print('U get value of user');
  } catch (_) {
    user = null;
  }
  Future removeDate() async {
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.remove('user');
  }


}  
