import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(115, 167, 238, 1),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              child: Center(
                child: Text('Fastodon', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            Image.asset('image/wallpaper.png'),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '例如：cmx.im',
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: Center(
                      child: Text('立即登录', style: TextStyle(color: Color.fromRGBO(115, 167, 238, 1), fontSize: 18),),
                    ),
                  )
                ],
              )
            ),
            Container(
              child: Center(
                child: Text('什么是域名', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      )
    );
  }
}