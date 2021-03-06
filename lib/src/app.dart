import 'package:finalapp/src/blocs/auth_bloc.dart';
import 'package:finalapp/src/models/authy_user.dart';
import 'package:finalapp/src/screens/home.dart';
import 'package:finalapp/src/screens/login.dart';
import 'package:finalapp/src/screens/verify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => authBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.deepPurple,
            accentColor: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.orbitronTextTheme()),
        home: StreamBuilder<DemoUser>(
            stream: authBloc.user,
            initialData: DemoUser(userId: 'placeholder',email: 'placeholder',verified: true),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return LoginScreen();
              } else if (snapshot.data.userId == 'placeholder'){
                return Scaffold(body: Center(child: CircularProgressIndicator(),),);
              }
              else if (snapshot.data.verified == false){
                return VerifyScreen(snapshot.data.email);
              } else
                return HomeScreen();
              }
            ),
      ),
    );
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}

class LandingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
