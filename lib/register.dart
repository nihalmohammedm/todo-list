import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _isHidden = true;
  var _isCHidden = true;

  TextEditingController mail = TextEditingController();

  TextEditingController pass = TextEditingController();

  TextEditingController cpass = TextEditingController();
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
                    child: Image.asset('assets/logo.png'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: mail,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'email',
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
                            hintText: 'password',
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
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: cpass,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'confirm password',
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isCHidden = !_isCHidden;
                                  });
                                },
                                icon: Icon(_isCHidden == true
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: _isCHidden,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              final email = mail.text;
                              final password = pass.text;
                              final cPassword = cpass.text;
                              if (email.isEmpty ||
                                  password.isEmpty ||
                                  cPassword.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Enter both email and password')));
                              } else if (password.length < 8) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'minimum 8 characters required')));
                              } else if (password != cPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('password doesn\'t match')));
                              } else {
                                print(
                                    'email : $email\npassword : $password\nconfirm : $cPassword');
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.lock), Text('  Sign up')],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
