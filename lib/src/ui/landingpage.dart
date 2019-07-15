
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uum/src/ui/graduates_menu.dart';
import 'package:uum/src/ui/visitor_menu.dart';

class LandingPage extends StatefulWidget {
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  double _opacityLogo = 1.0;
  bool _openMenu = false;
  bool _textBelowLogo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Visibility(
        visible: _openMenu,
        child: Container(
          padding: EdgeInsets.only(bottom: 280),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                FloatingActionButton.extended(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => GraduatesMenu())),
                  label: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF455A64),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Image.asset('assets/img/graduate.png', color: Colors.white),
                        ),
                        SizedBox(height: 2),
                        Text('Graduates', style: TextStyle(
                          color: Colors.black, 
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2
                          )
                        )
                      ],
                    ),
                  ),
                  isExtended: false,
                  heroTag: "graduateMenu",
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(80)
                  ),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 10),
                  child: FloatingActionButton.extended(
                    label: Icon(Icons.close),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        _openMenu = false;
                        _opacityLogo = 1.0;
                        _textBelowLogo = true;
                      });
                    },
                    isExtended: false,
                    heroTag: "closeMenu"
                  )
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => VisitorMenu())),
                  label: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(left: 25),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF455A64),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Image.asset('assets/img/visitor.png', color: Colors.white),
                        ),
                        SizedBox(height: 2),
                        Text('Visitor', style: TextStyle(
                          color: Colors.black, 
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2
                          )
                        )
                      ],
                    ),
                  ),
                  isExtended: false,
                  heroTag: "visitorMenu",
                ),
              ]
            )
          )
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        top: true,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _openMenu = true;
                      _opacityLogo = 0.5;
                      _textBelowLogo = false;
                    });
                  },
                  child: Opacity(
                    opacity: _opacityLogo,
                    child: Image.asset('assets/img/logo.png', height: 130, width: 162),
                  )
                ),
              ),
              SizedBox(height: 10),
              Visibility(
                visible: _textBelowLogo,
                child: Text('Click on the logo to open the menu.', style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
              )
            ]
          )
        ),
      )
    );
  }
  
}