import 'package:flutter/material.dart';
import 'Productdetail.dart';
class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var product_list = [
    {
      "name": "Nike air jordan",
      "picture": 'imagep/nikejordan.jpeg',
      "old_price":500,
      "price": 250,
    },
    {
      "name": "Fila",
      "picture": 'imagep/Filalll.jpeg',
      "old_price":550,
      "price": 255,
    },
    {
      "name": "Adidas",
      "picture": 'imagep/adidas.jpeg',
      "old_price":500,
      "price": 350,
    },
    {
      "name": "VANS",
      "picture": 'imagep/Van.jpeg',
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
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],

        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_new_price;
  final prod_old_price;
  final prod_price;

  Single_prod({
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
