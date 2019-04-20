
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Drawer Demo',
        color:Color(0xFFFFCC00),
        home: MyHomePage(title: 'Flutter Drawer Demo'),
        /******* ROUTE DEFINITIONS ******/
        routes: <String, WidgetBuilder>{
          "FirstPage": (BuildContext context) => new First(),
          "SecondPage": (BuildContext context) => new Second(),
          "ThirdPage": (BuildContext context) => new Third(),
          "/Twitter": (_) => new WebviewScaffold(
            url: "https://twitter.com/RowanUniversity",
            appBar: new AppBar(
              backgroundColor: Color(0xFFFFCC00),
            title: new Text("Twitter"),
           ),
          ),
           "/Facebook": (_) => new WebviewScaffold(
            url: "https://www.facebook.com/RowanUniversity",
            appBar: new AppBar(
              backgroundColor: Color(0xFFFFCC00),
            title: new Text("Facebook"),
           ),
          ),
          "/ruFam": (_) => new WebviewScaffold(
            url: "https://sites.rowan.edu/parentsfamily/family-weekend/index.html",
            appBar: new AppBar(
              backgroundColor: Color(0xFFFFCC00),
            title: new Text("Family Weekend"),
           ),
          )
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    var header = new UserAccountsDrawerHeader(
      accountName: Text('RU Family Weekend'),
      accountEmail: Text('Sept 28 - 30, 2018'),
      currentAccountPicture: Container(
        child: Image.asset('images/torch_36.png'),
        alignment: Alignment(-1, 1.6),),

      decoration: BoxDecoration(
      color: Color(0xFFFFCC00),),);

    /**** 1st Drawer Item ****/
    var item1Text = new Text('General');

    var item1Icon = Image.asset('images/info.png');

    var item1 = new ListTile(
        title: item1Text, leading: item1Icon, onTap: _onItem1OnTap);

    /**** 2nd Drawer Item ****/
    var item2Text = new Text('Schedule');

    var item2Icon = Image.asset('images/schedule.png');

    var item2 = new ListTile(
        title: item2Text, leading: item2Icon, onTap: _onItem2OnTap);

    /**** 3rd Drawer Item ****/

    var item3Text = new Text('Sponsors');

    var item3Icon = Image.asset('images/sponsors.png');

    var item3 = new ListTile(
        title: item3Text, leading: item3Icon, onTap: _onItem3OnTap);

    /**** 4th Drawer Item Title ****/

    var item4Text = new Text('RU on Social Media');

    var item4 = new ListTile(
        title: item4Text);

    /**** 5th Drawer Item  ****/

    var item5Text = new Text('Facebook');

    var item5Icon = Image.asset('images/fb.png');

    var item5 = new ListTile(
        title: item5Text, leading: item5Icon, onTap: _onItem5OnTap);

    /**** 6th Drawer Item  ****/

    var item6Text = new Text('Twitter');

    var item6Icon = Image.asset('images/twitter.png');

    var item6 = new ListTile(
        title: item6Text, leading: item6Icon, onTap: _onItem6OnTap);

    /**** Populated Drawer ****/
    var children = [header, item1, item2, item3, item4, item5, item6];

    var listView = new ListView(children: children);

    var drawer = new Drawer(child: listView);

    return new Scaffold(
      drawer: drawer,
      body: new GeneralInfo(),
      appBar: new AppBar(
        backgroundColor: Color(0xFFFFCC00),
        title: new Text('Family Weekend'),
      ),
    

    );
  }

  void _onItem1OnTap() {
    Navigator.of(context).pushNamed("FirstPage");
  }

  void _onItem2OnTap() {
    Navigator.of(context).pushNamed("SecondPage");
  }

  void _onItem3OnTap() {
    Navigator.of(context).pushNamed("ThirdPage");
  }
  void _onItem5OnTap() {
    Navigator.of(context).pushNamed("/Facebook");
  }
  void _onItem6OnTap() {
    Navigator.of(context).pushNamed("/Twitter");
  }
}
class GeneralInfo extends StatelessWidget{
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/rufwpic.png',
                      height: 375,
                      width: 264,),
                      new Text("2018 Family Weekend",
                      style: TextStyle(fontSize: 36, color: Color(0xFF57150B))),
                      new Text("General Info",
                      style: TextStyle(fontSize: 36, color: Color(0xFF57150B))),
                      new Text("Click Below for Information, Schedule, and Tickets",
                      style: TextStyle(fontSize: 14, color: Color(0xFF57150B))),
                    ]))));
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("General Info"), backgroundColor: Color(0xFFFFCC00)),
        body: new GeneralInfo());
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Second Page"), backgroundColor: Colors.deepOrange),
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.home, color: Colors.blue),
                        iconSize: 70.0,
                        onPressed: null,
                      ),
                      new Text("Second Page")
                    ]))));
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sponsors = ["Alumni Engagement", "Athletics", "Barnes & Noble", "Edelman Planetarium", "Gourmet Dining", 
"Harley E. Flack Student Mentoring Program", "History Department", "Office of Career Advancement",
"Social Justice, Inclusion & Conflict Resolution", "Orientation & Student Leadership Programs",
"Parent & Family Connections", "Rohrer College of Business",
"Rowan University Art Gallery", "Rowan After Hours", "Chamberlain Student Center & Campus Activities",
 "Campus Recreation", "WGLS-FM Radio Station", "Museum of Anthropology at Rowan University", "Edelman Fossil Park",
  "College of Performing Arts", "Wellness Center", "Veterans Affairs", "Greek Life"];
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Sponsors"), backgroundColor:  Color(0xFFFFCC00)),
        body: 
            ListView.builder(
        itemCount: sponsors.length,
        itemBuilder: (context, index) {
          return Card( //                           <-- Card widget
            child: ListTile(
              title: Text(sponsors[index]),
            ),
          );
        },
      )
          
            );
  }
}