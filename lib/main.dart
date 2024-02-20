import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _navigateToPage2() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Page2(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.people, size: 50, color: Colors.white),
        backgroundColor: Colors.deepOrange[500],
        title: Text(
          "LOGIN USER",
          style: TextStyle(fontSize: 50, color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white,fontSize: 20), 
                ),
                style: TextStyle(color: Colors.white), 
              ),
              SizedBox(height: 50),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white,fontSize: 20), 
                ),
                style: TextStyle(color: Colors.white), 
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  _navigateToPage2();
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white,fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class Page2 extends StatelessWidget {
  final String username;
  final String password;

  Page2({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[500],
        title: Text(
          'หน้าข้อมูลของคุณ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 190,
                backgroundImage: AssetImage('assets/profile_picture.jpg'),
              ),
              Text(
                'Username: $username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Text(
                'Password: $password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}


