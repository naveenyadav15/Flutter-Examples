import 'package:bloclogin/bloc.dart';
import 'package:bloclogin/pagetwo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Widget child;

  LoginPage({Key key, this.child}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

var cHeight, cWidth;
bool obsecure = true;

class _LoginPageState extends State<LoginPage> {
  var icon = Icons.visibility;
  changeThePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PageTwo(),
      ),
    );
  }

  changeIcon() {
    obsecure = !obsecure;
    if (obsecure) {
      setState(() {
        icon = Icons.visibility;
      });
    } else {
      setState(() {
        icon = Icons.visibility_off;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();
    cHeight = MediaQuery.of(context).size.height;
    cWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        height: cHeight,
        width: cWidth,
        child: Center(
          child: Column(
            children: <Widget>[
              StreamBuilder<String>(
                  stream: bloc.email,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: bloc.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Email address",
                        labelText: "Email",
                        errorText: snapshot.error,
                      ),
                    );
                  }),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              StreamBuilder<String>(
                  stream: bloc.password,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: bloc.passwordChanged,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      obscureText: obsecure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(icon),
                          onPressed: changeIcon,
                        ),
                        hintText: "Enter password",
                        labelText: "Password",
                        errorText: snapshot.error,
                      ),
                    );
                  }),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              StreamBuilder<bool>(
                  stream: bloc.submitCheck,
                  builder: (context, snapshot) {
                    return RaisedButton(
                      onPressed: snapshot.hasData
                          ? () => changeThePage(context)
                          : null,
                      child: Text("Submit"),
                      color: Colors.tealAccent,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
