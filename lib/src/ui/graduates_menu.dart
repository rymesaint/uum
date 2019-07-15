
import 'package:flutter/material.dart';
import 'package:uum/src/models/Menu.dart';

class GraduatesMenu extends StatefulWidget {
  State<GraduatesMenu> createState() => _GraduatesMenu();
}

class _GraduatesMenu extends State<GraduatesMenu> {
  List<Menu> _menus = [];

  @override
  void initState() {
    super.initState();
    loadMenus();
  }

  loadMenus() {
    List<Menu> menus = [];
    menus.add(
      Menu('Before Graduation', 'assets/img/before-graduation.png')
    );
    menus.add(
      Menu('The Ceremony', 'assets/img/ceremony.png')
    );
    menus.add(
      Menu('Post Ceremony', 'assets/img/post-ceremony.png')
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
          Image.asset('assets/img/graduates-bg.jpg', width: size, fit: BoxFit.cover),
          Positioned(
            top: 15,
            left: 4,
            child: BackButton(color: Colors.white)
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 130),
              child: Text('Graduates', style: TextStyle(
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
      physics: ScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: _menus.length,
    );
  }
}