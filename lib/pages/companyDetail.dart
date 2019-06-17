import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CompanyDetail extends StatefulWidget {
  @override
  _CompanyDetailState createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: Image.network(
            "https://images.unsplash.com/photo-1531497865144-0464ef8fb9a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80",
            fit: BoxFit.cover,
          ),
          height: screenHeight * 0.4,
        ),
        _detailTest(),
      ],
    ));
  }

  Widget _detailTest() {
    var screenHeight = MediaQuery.of(context).size.height;
    final databaseReference = FirebaseDatabase.instance.reference();
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.3),
      child: Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(90.0)),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: 33.0, top: 20.0, right: 10.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Wolkswagen Company",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w300),
                      ),
                      Icon(
                        Icons.bookmark_border,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Text("Project Manager"),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                      Text("+2040 Çalışan   "),
                      SizedBox(
                        height: 50.0,
                      ),
                      Icon(Icons.person_add, color: Colors.grey, size: 25.0),
                      Text("10 Kişi"),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Project Manager",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        "1 hafta önce yayınlandı.",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      Icon(
                        Icons.access_time,
                        size: 10.0,
                      ),
                      Text(
                        "    3 üzeri başvuru",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      Icon(
                        Icons.access_time,
                        size: 10.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Descriptions",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.w300),
                  ),
                  Image.network(
                      "https://icdn5.digitaltrends.com/image/google_maps_offline_download_1-500x300-c.jpg"),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _showDialog();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Ask a questions",
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                              ),
                              color: Colors.purple.withOpacity(.4)),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                         _showDialog();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Submit Application",
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                              ),
                              color: Colors.purple.withOpacity(.4)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Wolswagen Company"),
          content: new Text("Click here to apply"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Submit application"),
              onPressed: () {
                Navigator.of(context).pop(setValue());
              },
            ),
          ],
        );
      },
    );
  }



setValue() {
  final DatabaseReference database =
      FirebaseDatabase.instance.reference().child("test");
  database.push().set({
    "title": "Wolswagen Company",
    "Unit": "Project Manager",
    "Desc": "Lorem ipsum"
  });
  
}
}