import 'package:flutter/material.dart';

import 'Logo.dart';


class HorizontalList extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'image/Nike.jpg',
            image_caption: 'Nike',
          ),

          Category(
            image_location: 'image/Adidas logo blue Sticker.png',
            image_caption: 'Adidas',
          ),

          Category(
            image_location: 'image/Puma.jpg',
            image_caption: 'Puma',
          ),

          Category(
            image_location: 'image/flla.jpg',
            image_caption: 'Fila',
          ),

          Category(
            image_location: 'image/Vans.jpg',
            image_caption: 'Vans',
          ),
        ],
      ),
    );
  }
}


class Category extends StatelessWidget{
  final String image_location;
  final String image_caption;

  Category({ this.image_caption, this.image_location,});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Logo()));},
        child:  Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location,width: 100.0,height: 80.0,), //Location file pic
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),
        ),
      ),
    );
  }
}