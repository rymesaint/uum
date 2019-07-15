
import 'package:flutter/material.dart';
import 'package:uum/src/models/Menu.dart';

class VisitorMenu extends StatefulWidget {
  State<VisitorMenu> createState() => _VisitorMenu();
}

class _VisitorMenu extends State<VisitorMenu> {
  List<Menu> _menus = [];

  @override
  void initState() {
    super.initState();
    loadMenus();
  }

  loadMenus() {
    List<Menu> menus = [];
    menus.add(
      Menu('Live Streaming', 'assets/img/live-streaming.png')
    );
    menus.add(
      Menu('Session List', 'assets/img/session-list.png')
    );
    menus.add(
      Menu('Dress Code', 'assets/img/dresscode.png')
    );
    menus.add(
      Menu('Invitation Card', 'assets/img/invitation.png')
    );
    menus.add(
      Menu('Other Reminder', 'assets/img/reminder.png')
    );
    menus.add(
      Menu('Prayer Info', 'assets/img/prayer.png')
    );
    menus.add(
      Menu('Contact', 'assets/img/phonebook.png')
    );
    menus.add(
      Menu('Location', 'assets/img/map.png')
    );
    _menus.addAll(menus);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _header(),
                SizedBox(height: 10),
                _menusView()
              ],
            )
          ),
        )
      ),
    );
  }

  _header() {
    var size = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 5)
          )
        ]
      ),
      height: 180,
      child: Stack(
        children: <Widget>[
          Image.asset('assets/img/visitor-bg.jpg', width: size, fit: BoxFit.cover),
          Positioned(
            top: 15,
            left: 4,
            child: BackButton(color: Colors.white)
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 130),
              child: Text('Visitor', style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold
              ))
            )
          )
        ],
      )
    );
  }

  _menusView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3
      ),
      itemBuilder: (context, int index) {
        return InkWell(
          onTap: () => print(index),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset(_menus[index].asset),
                ),
                SizedBox(height: 10),
                Text(_menus[index].text)
              ],
            )
          )
        );
      },
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      primary: true,
      itemCount: _menus.length,
    );
  }
}