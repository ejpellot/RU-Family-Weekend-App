
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
                    ])));
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
  Future _detailsDialog(BuildContext context, String message) async {
          return showDialog(
 context: context,
 child: new AlertDialog(
 title: new Text("Event Details"),
content: new Text(message),
 actions: <Widget>[
 new FlatButton(
 onPressed: () => Navigator.pop(context), child: new Text('Close'))
 ],
 ));
 }

    // Populate array with events_fri
         const events_fri =["Registration and Welcome","Five Dollar Friday at the Glassworks Eatery",
        "How to Create a Killer LinkedIn Profile That Will Get You Noticed",
        "Heather Ujiie: Dystopian Garden Paradise",
         "Rowan Division III Ice Hockey vs. Rutgers Camden",
         "Laser Pink Floyd: Dark Side of the Moon - Planetarium Show",
         "Rowan Division II Ice Hockey vs. Virginia Tech",
         "Laser Pink Floyd: Dark Side of the Moon - Planetarium Show","Drive-in Movie", "Laser Pink Floyd: Dark Side of the Moon - Planetarium Show",];

//populate array with events_sat
         const events_sat = ["Registration and Welcome",
         "The SHOP (Students Helping Other Profs) Food Pantry Donations",
        "They Fought We Ride, Run, or Walk",
        "MARU (Museum of Anthropology at Rowan University) Tour",
         "WGLS-FM Radio Studio Tour", "Heather Ujii: Dystopian Garden Paradise",
        "Story Telling and Craft Time at Barnes and Noble","Instrument Petting Zoo",
        "Ingredients for a Great Career: Exploring OCA Services and Resources",
        "Family Block Party/Vendor Fair","Flu Shots","Sweets in the Sukkah", "Hollybush Tour",
        "Rowan University Field Hockey vs. William Patterson University",
        "Profecy A Cappella Performance", "Liquid Nitrogen Ice Cream Demonstration","Rowan Family Fossil Find",
        "Finance Lab Demonstration","Black Holes - Planetarium Show", "Stars of the Pharaohs - Planetarium Show",
        "Rowan University Football vs. Christopher Newport University","Rowan University Men's Soccer vs. Kean University",
        "Laser Queen - Planetarium Show","Laser Queen - Planetarium Show","End of Summer Bingo","Laser Queen - Planetarium Show",];

//populate array with events_sun
         const events_sun = ["A Service of Many Faiths", "Black Jack Walk",
        "Sweet and Savory Brunch at the Glassworks Eatery", "Hollybush Tour",
        "Family Show - Planetarium Show","Stars of the Pharaohs - Planetarium Show",];

//Populate array with fri events descriptions
List <String> description_fri = new List(10);
        description_fri[0] = "Time: 4:00pm - 7:00pm \n Location: Atrium, Savitz Hall 2nd Floor \n Students or family members can pick up their reserved tickets or purchase tickets while supplies last.  We encourage guests to bring non-perishable food and toiletries donations for The Shop at Rowan" +
                "University (Students Helping Other Profs), serving Rowan University students faced with food insecurities.";
        description_fri[1] = "Time: 4:30pm - 7:30pm \n Location: Holly Pointe Commons \n Cost: 5 Dollars - Adults, Children, Senior Citizens(Rowan students can use meal plans/special-priced meal.) \n " +
                "Enjoy a wide variety of selections in our newest all you can eat dining " +
                "facility including classic cuisine, pizza & pasta, soup & salad, traditional grill and more...";
        description_fri[2] = "Time: 4:00pm - 5:00pm \n Location: Office of Career Advancement, Savitz Hall 2nd Floor \n Cost: Free \n " +
                "Whether you are job or internship hunting, gathering leads, or networking in your career field, having a professional, eye-catching LinkedIn" +
                " profile is an excellent idea to make sure that you can be found by the right people at the right time.  come learn how to complete your LinkedIn " +
                "profile in a way that appeals to prospects that are quickly scanning to see if you have what they need.  ";
        description_fri[3] = "Time: 4:00pm - 7:00pm\n Location: Rowan University Art Gallery, 301 West High Street, Glassboro NJ\n Cost: Free\n Rowan University art " +
                "Gallery will be producing and presenting an interdisciplinary program that turns a lens on how fashion and textile design is translated " +
                "as a visual arts practice.  This program comes at a time when the arts and design sectors are blending creative principles and crossing over into the " +
                "multi-disciplinary practices.  Fashion design has crossed over into a platform where explorations into gender and cultural identity can reach a broader audience outside" +
                " the mainstream fashion and design sectors.  Artist Heather Ujiie's work speaks directly to issues that are currently relevant in our society: transgender, sexuality, environmental issues, science and technology.  ";
        description_fri[4] = "Time: 5:30pm - TBA\n Location: Hollydell Ice Arena, 600 Hollydell Drive, Sewell NJ\n Cost: 5 Dollars - Adults, Free- Rowan Students(With ID) and children(Athletic passes included by the Athletic Department cannot be used for this event.)\n " +
                "Join Rowan's hockey club for its opening night for the 2018/19 season!";
        description_fri[5] = "Time: 7:00pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: 5 Dollars - Adults, 3 Dollars - Children and Senior Citizens (Under 16 and over 60), 3 Dollars - Rowan Students (With ID)\n " +
                "Show details and ticket purchases can be found at www.rowan.edu/planetarium";
        description_fri[6] = "Time: 8:15pm - TBA\n Location: Hollydell Ice Arena, 600 Hollydell Drive, Sewell NJ\n Cost: 5 - Adults, Free- Rowan Students(With ID) and children(Athletic passes included by the Athletic Department cannot be used for this event.)\n " +
                "Join Rowan's hockey club for its opening night for the 2018/19 season!";
        description_fri[7] = "Time: 8:30pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: 5 Dollars - Adults, 3 Dollars - Children and Senior Citizens (Under 16 and over 60), 3 Dollars - Rowan Students (With ID)\n " +
                "Show details and ticket purchases can be found at www.rowan.edu/planetarium";
        description_fri[8] = "Time: 9:00pm - 1:00am\n Location: South Jersey Technology Park\n Cost: Free\n Enjoy a family friendly classic under the stars and go back to the days of drive-in movies.  No worries if you don't have a car, " +
                "a free shuttle will be provided from the Student Center Half-Circle starting at 8:30pm.  Enjoy free food and drinks while you watch.  ";
        description_fri[9] = "Time: 10:00pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: 5 Dollars - Adults, 3 Dollars - Children and Senior Citizens (Under 16 and over 60), 3 Dollars- Rowan Students (With ID)\n " +
                "Show details and ticket purchases can be found at www.rowan.edu/planetarium";
                
//Populate array with sat events descriptions

    return new Scaffold(
        appBar: new AppBar(
            title: new Text("RU Family Weekend 2018"), backgroundColor:Color(0xFFFFCC00)),
            body: new Container(
                   child: new Column(
                     children: <Widget>[
                     new Container(
                                    height: 40,
                                    margin:  EdgeInsets.all(10),
                                    child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                              new FlatButton(
                                                        onPressed: ()=> {},
                                                        color: Colors.brown[900],
                                                        padding: EdgeInsets.all(10.0),
                                                        child:Column(
                                                              children: <Widget>[
                                                                          Text("28th")
                                                                          ],
                                                                    )
                                                                ),
                                              new FlatButton(
                                                        onPressed: ()=> {
                                                        },
                                                        color: Colors.brown[800],
                                                        padding: EdgeInsets.all(10.0),
                                                        child:Column(
                                                                children: <Widget>[
                                                                  Text("29th")
                                                                ],
                                                              )
                                                      ),
                                              new FlatButton(
                                                onPressed: ()=> {},
                                                color: Colors.brown[700],
                                                padding: EdgeInsets.all(10.0),
                                                child:Column(
                                                  children: <Widget>[
                                                    Text("30th")
                                                              ],
                                                          )
                                                     ),
                                                ]
                                               )
                                  ),
                                  new Expanded(
                                    child:ListView.builder(
                                     itemCount: events_fri.length,
                                    itemBuilder: (context, index) {
                                        return Card( //     <-- Card widget
                                                   child: ListTile(
                                                   title: Text(events_fri[index]),
                                                   onTap: (){_detailsDialog(context, description_fri[index]);},
                                                ),
                                            );
                                        },
                            )
                                  )
                     ]
                   )
            )
                    );
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
          return Card( //                           <-- Card widget11111111
            child: ListTile(
              title: Text(sponsors[index]),
            ),
          );
        },
      )
          
            );
  }
}