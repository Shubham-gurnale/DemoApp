import 'dart:async';

import 'package:finalapp/src/blocs/auth_bloc.dart';
import 'package:finalapp/src/screens/home.dart';
import 'package:finalapp/src/screens/signup.dart';
import 'package:finalapp/src/screens/verify.dart';
import 'package:finalapp/src/widgets/alert.dart';
import 'package:finalapp/src/widgets/button.dart';
import 'package:finalapp/src/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupEmailScreen extends StatefulWidget {
  @override
  _SignupEmailScreenState createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  StreamSubscription _errorMessageSubscription;
  StreamSubscription _processRunningSubscription;
  StreamSubscription _userSubscription;
  bool _isLoading = false;

  @override
  void initState() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.clearValues();

    _errorMessageSubscription = authBloc.errorMessage.listen((errorMessage) {
      if (errorMessage != '') {
        AuthyAlert.showErrorDialog(context, errorMessage);
      }
    });

    _processRunningSubscription = authBloc.processRunning.listen((running) {
      if (running != null) {
        setState(() {
          _isLoading = running;
        });
      }
    });

    _userSubscription = authBloc.user.listen((user) {
      if (user != null)
        if (user.verified == true) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => VerifyScreen(user.email)));
        }
    });

    super.initState();
  }

  @override
  void dispose() {
    _errorMessageSubscription.cancel();
    _processRunningSubscription.cancel();
    _userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.solidArrowAltCircleLeft,
            size: 45.0,
            color: Colors.deepPurple,
          ),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SignupScreen())),
        ),
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<String>(
                      stream: authBloc.email,
                      builder: (context, snapshot) {
                        return AuthyTextField(
                          label: 'Email',
                          textInputType: TextInputType.emailAddress,
                          onChanged: authBloc.changeEmail,
                          errorText: snapshot.error,
                        );
                      }),
                  StreamBuilder<String>(
                      stream: authBloc.password,
                      builder: (context, snapshot) {
                        return AuthyTextField(
                          label: 'Password',
                          obscureText: true,
                          onChanged: authBloc.changePassword,
                          errorText: snapshot.error,
                        );
                      }),
                  StreamBuilder<String>(
                      stream: authBloc.confirmPassword,
                      builder: (context, snapshot) {
                        return AuthyTextField(
                          label: 'Confirm',
                          obscureText: true,
                          onChanged: authBloc.changeConfirmPassword,
                          errorText: snapshot.error,
                        );
                      }),
                ],
              ),
            ),
            StreamBuilder<bool>(
                stream: authBloc.isEmailSignupValid,
                builder: (context, snapshot) {
                  print(snapshot.data);
                  return AuthyButton(
                    text: 'Sign up',
                    enabled: (snapshot.data == true) ? true : false,
                    onTap: authBloc.signupEmail,
                  );
                })
          ],
        ),
      ),
    );
  }
}
