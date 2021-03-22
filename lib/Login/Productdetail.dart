import 'package:flutter/material.dart';

import 'Homepage.dart';





class Product_detail extends StatefulWidget {
  final Product_detail_name;
  final Product_detail_new_price;
  final Product_detail_old_price;
  final Product_detail_picture;

  Product_detail({
    this.Product_detail_name,
    this.Product_detail_new_price,
    this.Product_detail_old_price,
    this.Product_detail_picture,
  });
  @override
  _Product_detailState createState()  => _Product_detailState();
}


class _Product_detailState extends State<Product_detail>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.black,
        title: InkWell(
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>new HomePage()));},
            child: Text('SIMI SHOPE')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search,
                  color: Colors.white
              ),
              onPressed: null)
        ],
      ),
      body: Container(
        color: Colors.black87,
        child: new ListView(

          children: <Widget>[
            new Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                  color: Colors.black,
                  child: Image.asset(widget.Product_detail_picture),
                ),
                footer: new Container(
                  color:Colors.black54,
                  child: ListTile(
                    leading: new Text(widget.Product_detail_name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white),),

                    title: new Row(
                        children: <Widget>[
                          Expanded(
                            child: new Text("\$${widget.Product_detail_old_price}",
                              style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),),
                          ),

                          Expanded(
                            child: new Text("\$${widget.Product_detail_new_price}",style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ),
            // ++++++++++++++++++++++++++++++++++++ the first buttons++++++++++++
            Row(
              children: <Widget>[

                // -----------the size bottom++++++++++++++++
                Expanded(
                  child: MaterialButton(onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("Choose the size"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){},
                                child: new Text("Close"),)

                            ],
                          );
                        }
                    );
                  },
                    color: Colors.black87,
                    textColor: Colors.yellow,
                    elevation: 0.2,
                    child:  Row(
                      children: <Widget> [
                        Expanded(
                          child: new Text("Size"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),)
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: MaterialButton(onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Colors"),
                            content: new Text("Choose the Color"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){},
                                child: new Text("Close"),)

                            ],
                          );
                        }
                    );
                  },
                    color: Colors.black87,
                    textColor: Colors.yellow,
                    elevation: 0.2,
                    child:  Row(
                      children: <Widget> [
                        Expanded(
                          child: new Text("Color"),),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),)
                      ],
                    ),
                  ),
                ),


                Expanded(
                  child: MaterialButton(onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Qty"),
                            content: new Text("Choose the Qty"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){},
                                child: new Text("Close"),)

                            ],
                          );
                        }
                    );
                  },
                    color: Colors.black87,
                    textColor: Colors.yellow,
                    elevation: 0.2,
                    child:  Row(
                      children: <Widget> [
                        Expanded(
                          child: new Text("Qty"),),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),)
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // ++++++++++++++++++++++++++++++++++++ the second buttons++++++++++++
            Row(
              children: <Widget>[

                // -----------the size bottom++++++++++++++++
                Expanded(
                  child: MaterialButton(
                      onPressed: (){},
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 0.2,
                      child:  new Text("Buy now")
                  ),
                ),

                new IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.red), onPressed: (){}),
                new IconButton(icon: Icon(Icons.favorite_border, color: Colors.red), onPressed: (){}),
              ],
            ),
            Divider(),
            new ListTile(
              title: new Text("Details", style: TextStyle(color: Colors.white),),
              subtitle: new Text(
                  "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first ever basketball shoe to feature Nike Air technology, revolutionizing the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come"
                  ,style: TextStyle(color: Colors.white),
              ),
            ),
            Divider(),
            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text("Product name", style: TextStyle(color: Colors.grey),),),
                Padding(padding: EdgeInsets.all(5.0),
                  child: new Text(widget.Product_detail_name, style: TextStyle(color: Colors.white),),)
              ],
            ),
            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text("Product shoes", style: TextStyle(color: Colors.grey),),),
                Padding(padding: EdgeInsets.all(5.0),
                  child: new Text("Nike,adidas,PUMA,VANS" , style: TextStyle(color: Colors.white)),),
              ],
            ),
            new Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text("Product condition", style: TextStyle(color: Colors.grey),),),
                Padding(padding: EdgeInsets.all(5.0),
                  child: new Text("NEW", style: TextStyle(color: Colors.white)),)
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:new Text("Similar Product" , style: TextStyle(color: Colors.white)),),


            ///ການ​ເອີ້ນ​ຫນ້າ​ອື່ນມ​າ​ໃຊ້ ໂດນ​ໃຊ້​ຈອນ​ແທ່ນ​ເນີ​ມາ​ໃຫ້
            Container(
              height: 360.0,
              child: Similar_products(),
            ),

          ],
        ),
      ),
    );
  }
}



class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name": "NIKE",
      "picture": 'imagep/NIkeII.jpeg',
      "old_price":500,
      "price": 250,
    },
    {
      "name": "FILE",
      "picture": 'imagep/Fila-11.jpeg',
      "old_price":500,
      "price": 350,
    },
    {
      "name": "VANS",
      "picture": 'imagep/Van.jpeg',
      "old_price":250,
      "price": 150,
    },
    {
      "name": "VAN",
      "picture": 'imagep/VanII.jpeg',
      "old_price":250,
      "price": 150,
    },
  ];
  @override
  Widget build(BuildContext context){
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context,int index){
        return Similar_Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],

        );
      },
    );
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_new_price;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_new_price,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push (
                new MaterialPageRoute(
                    builder: (context)
                    => new Product_detail(
                        Product_detail_name: prod_name,
                        Product_detail_new_price: prod_price,
                        Product_detail_old_price: prod_old_price,
                        Product_detail_picture:  prod_picture
                    )
                )
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    prod_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "\$$prod_price ",
                    style: TextStyle(
                        color:  Colors.red,
                        fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    "\$$prod_old_price",
                    style: TextStyle(color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );

  }
}
