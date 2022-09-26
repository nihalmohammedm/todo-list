import 'package:flutter/material.dart';
import 'package:todo_project/register.dart';
import 'package:todo_project/home.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isHidden = true;

  TextEditingController mail = TextEditingController();

  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 120),
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/loginicon.png'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: mail,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'User Name',
                            prefixIcon: Icon(Icons.mail)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: pass,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isHidden = !_isHidden;
                                  });
                                },
                                icon: Icon(_isHidden == true
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: _isHidden,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              final email = mail.text;
                              final password = pass.text;
                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Enter both email and password')));
                              } else if (email == 'admin' &&
                                  password == '123') {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              } else {
                                print('mail : $email\npass : $password');
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.lock), Text('  Sign in')],
                            )),
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text('New user ? Register here')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
