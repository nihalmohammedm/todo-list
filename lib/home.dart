import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_project/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        actions: [
          PopupMenuButton(
              onSelected: (item) => OnSelected(context, item),
              itemBuilder: (context) =>
                  [PopupMenuItem<int>(value: 0, child: Text('Log Out'))])
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(left: 20.0, right: 10.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                'All ToDos',
                style: TextStyle(fontSize: 35),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 70,
                    width: 302,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black.withOpacity(.2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'add a new todo item',
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                      width: 120,
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            size: 25,
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void OnSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
        break;
    }
  }
}
