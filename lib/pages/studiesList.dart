import 'package:flutter/material.dart';
import 'package:flutter_login_demo/pages/companyDetail.dart';

class StudiesList extends StatefulWidget {
  @override
  _StudiesListState createState() => _StudiesListState();
}

class _StudiesListState extends State<StudiesList> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Company',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromRGBO(37, 38, 94, 1),
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      'List',
                      style: TextStyle(
                          color: Color.fromRGBO(37, 38, 94, 1),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 400.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          homeWidget("Wolswagen Company", "Project Manager",
                              "https://firebasestorage.googleapis.com/v0/b/internup-594b3.appspot.com/o/wolks.png?alt=media&token=9a5e6a5a-15ea-474a-8c98-b99977aa7f9d"),
                          
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: bottomAppBar(),
    );
  }

  Widget homeWidget(String title, String date, String images) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return CompanyDetail();
        }));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 250.0,
        height: 375.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: 300.0,
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.amber, BlendMode.overlay),
                  image: NetworkImage('$images'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              right: 5,
              child: FloatingActionButton(
                heroTag: title,
                mini: true,
                backgroundColor: Color.fromRGBO(37, 38, 94, 1),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                onPressed: () {
                  try {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CompanyDetail()));
                  } catch (e) {
                    print(e.toString());
                  }

                  //MaterialPageRoute(builder: (context) => TestDetail());
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestDetail()));
                  //Navigator.of(context).pushNamed("/detail");
                },
              ),
            ),
            Positioned(
              bottom: 30,
              left: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                        color: Color.fromRGBO(37, 38, 94, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  Row(
                    children: <Widget>[
                      Icon(Icons.date_range,
                          color: Color.fromRGBO(37, 38, 94, 1)),
                      Text(date,
                          style: TextStyle(
                              color: Color.fromRGBO(37, 38, 94, 1),
                              fontSize: 17.0)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _selectedWidget(Icon icon, String str) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          color: Color.fromRGBO(37, 38, 94, 1)),
      child: Row(
        children: <Widget>[
          icon,
          Text(
            str,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget bottomAppBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          index == 1
              ? _selectedWidget(
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  "Home",
                )
              : IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Color.fromRGBO(37, 38, 94, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
          index == 2
              ? _selectedWidget(
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  "Profil")
              : IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Color.fromRGBO(37, 38, 94, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
          index == 3
              ? _selectedWidget(
                  Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  "Message")
              : IconButton(
                  icon: Icon(
                    Icons.message,
                    color: Color.fromRGBO(37, 38, 94, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 3;
                    });
                  },
                ),
          index == 4
              ? _selectedWidget(
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  "Settings")
              : IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Color.fromRGBO(37, 38, 94, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 4;
                    });
                  },
                ),
        ],
      ),
    );
  }
}
