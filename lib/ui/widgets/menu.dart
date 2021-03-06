import 'package:fluttergrab/ui/widgets/menuclipper.dart';
import 'package:flutter/material.dart';

adminDrawer(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 16.0, right: 40),
    decoration: BoxDecoration(
      color: Colors.amber[700],
      boxShadow: [BoxShadow(color: Colors.black45)]
    ),
    width: 300.0,
    height: double.maxFinite,
    child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            Text(
              "Admin Menu",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            SizedBox(height: 40.0),
            _buildRow(Icons.people, "Manage Accounts"),
            _buildDivider(),
            _buildRow(Icons.calendar_today, "Manage Courses"),
            _buildDivider(),
            _buildRow(Icons.note, "Manage Subjects"),
            _buildDivider(),
          ],
        ),
      ),
    ),
  );
}

buildDrawer(BuildContext context) {
  final String _img = "assets/teacher.png";
  return ClipPath(
    clipper: MenuClipper(),
    child: Container(
        padding: EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
          color: Colors.amber[700],
          boxShadow: [BoxShadow(color: Colors.black45)]
        ),
        width: 300.0,
        height: double.maxFinite,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.power_settings_new,
                  color: Colors.amber[200],
                ),
                onPressed: () => Navigator.of(context).pushReplacementNamed('/auth'),
              ),
            ),
            Container(
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.amber[200], Colors.amber[700]]
                )
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(_img),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              "Kim Testa",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Text(
              "kim.testa@curiouslab.sg",
              style: TextStyle(color: Colors.amber[200], fontSize: 16.0),
            ),
            Text(
              "Admin",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            SizedBox(height: 30.0),
            _buildRow(Icons.home, "Home"),
            _buildDivider(),
            _buildRow(Icons.person_pin, "Your profile"),
            _buildDivider(),
            _buildRow(Icons.settings, "Settings"),
            _buildDivider(),
            _buildRow(Icons.email, "Contact us"),
            _buildDivider(),
            _buildRow(Icons.help, "Help"),
            _buildDivider(),
          ],
        ),
      ),
    ),
  ),
);
}

Divider _buildDivider() {
return Divider(
  color: Colors.amber[200],
);
}

Widget _buildRow(IconData icon, String title) {
final TextStyle tStyle = TextStyle(color: Colors.amber[200], fontSize: 16.0);

return FlatButton(
  onPressed: () {},
  padding: EdgeInsets.symmetric(vertical: 8.0),
  child: Row(children: [
    Icon(icon, color: Colors.amber[200]),
    SizedBox(width: 10.0),
    Text(
      title,
      style: tStyle,
    ),
  ]),
);
}