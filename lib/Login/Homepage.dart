import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'Cart_product.dart';
import 'HorizontalList.dart';
import 'Login_screen.dart';
import 'Logo.dart';
import 'Products.dart';
import 'chat.dart';

class HomePage extends StatefulWidget{

  static const routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    Widget image_carousel=new Container(
      height: 200,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('image/one.jpg'),
          AssetImage('image/three.jpg'),
          AssetImage('image/two.jpg'),
        ],
        autoplay: true, ///ການ​ສະ​ໄລ​ຂອງ​ຮູບ
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 3.0, ///ຂ​ອບ​ທາງ​ລຸ​້ມ​ສວນ​ການ​ເບີ່ງ
        dotSize: 4.0,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation:  0.1,
        backgroundColor: Colors.black87,
        title: Text('SIMI SHOPE',  style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new chat()));
              })
        ],
      ),
      drawer: new Drawer(

        child: Container(
          color: Colors.black87,
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text('Samphathai VONEMANY'),
                accountEmail: Text('samphathaivn@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    radius: 150,
                    backgroundImage: AssetImage('image/product/Sam.jpg'),
                    backgroundColor: Colors.lime[900],
                  ), //Text
                ),
                decoration: new BoxDecoration(color: Colors.black87),// color top
              ),

              //   //
              // ),

              //body

              InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));},
                child: ListTile(
                  title: Text('Home Page',style: TextStyle(color: Colors.white)),
                  leading:Icon(Icons.home,color:  Colors.lime[900],
                  ),
                ),

              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My account',style: TextStyle(color: Colors.white)),
                  leading:Icon(Icons.person,color:  Colors.lime[900],
                  ),
                ),
              ),

              InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart_product()));},
                child: ListTile(
                  title: Text('My Order',style: TextStyle(color: Colors.white)),
                  leading:Icon(Icons.shopping_cart,color:  Colors.lime[900],
                  ),
                ),
              ),

              InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new Logo()));},
                child: ListTile(
                  title: Text('Categoris',style: TextStyle(color: Colors.white)),
                  leading:Icon(Icons.dashboard,color:  Colors.lime[900],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context) => chat())); ///ແມ່ນ​ການ​ອີ້ນ​ໜ້າ​ອື່ນ​ມາ​ໃຊ້
                },
                child: ListTile(
                  title: Text('Shopping chart',style: TextStyle(color: Colors.white)),
                  leading:Icon(Icons.shopping_cart,color:  Colors.lime[900],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: ListTile(
                  title: Text('Log Out',style: TextStyle(color: Colors.white)),
                  leading:Icon(Icons.logout,color:  Colors.lime[900],
                  ),
                ),
              ),

              Divider(),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Settings',style: TextStyle(color: Colors.white)),
                  leading:Icon(Icons.settings,
                      color:  Colors.lime[900],
                  ),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('About',style: TextStyle(color: Colors.white)),
                  leading:Icon(Icons.help_outline,
                      color:  Colors.lime[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Container(
        color: Colors.black54,
        child: new ListView(
          children: <Widget>[
            image_carousel,
            new Padding (padding: const EdgeInsets.all(4.0),

              child: new Text('Brand'),
            ),
            HorizontalList(),



            new Padding(padding: const EdgeInsets.all(4.0),
              child: new Text('Recent Products'),
            ),


            Container(
              height: 350.0,
              child: Product(),
            ),
          ],
        ),
      ),
    );
  }
}