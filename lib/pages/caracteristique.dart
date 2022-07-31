import 'package:loc26/pages/form.dart';
import 'package:loc26/widgets/Containers.dart';
import 'package:loc26/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';

class Caracteristique extends StatelessWidget {
  final double price;
  final String title;
  final String brand;
  final String path;
  final String color;
  final String carb;
  final String categorie;
  final bool dispo;

  const Caracteristique({ Key? key,required this.dispo,required this.categorie,required this.carb,required this.color,required this.path, required this.price, required this.title, required this.brand }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Builder(
        builder: (context) =>
     Scaffold(
        appBar: MyAppBar(),
        body:Column(
          children: [
            SizedBox(height:20,),
            Text(title,textAlign: TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize:35,fontStyle: FontStyle.italic,letterSpacing:8)),
            SizedBox(height:20,),
            Text(brand,style:TextStyle(fontWeight: FontWeight.bold , fontSize: 20,fontStyle:FontStyle.italic,color:Colors.grey,letterSpacing:5)),
            SizedBox(height:20,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Hero(tag:title,child: Image.asset(path),),
            ),
            SizedBox(height:15,),
            Column(
              children: [
                Text(price.toString()+' DH',style:TextStyle(color: Colors.deepOrange[600],fontWeight:FontWeight.bold,fontSize:40)),
                Text(' Par Jour',style:TextStyle(color: Colors.green,fontSize:18)),
              ],
            ),
            Container(
              margin:EdgeInsets.only(top:18),
              child:
                  MyContainer(color:color , carb:carb , categorie:categorie),  
              ),
              Container(
                margin:EdgeInsets.only(top:35),
                child: ElevatedButton.icon(
                  onPressed: 
                  dispo ? 
                  () {
                       Navigator.push(context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyCustomForm(voiture:title)
                              
                              )
                              );
                  }
                  : null,
                  label: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Réserver maintenant',style:TextStyle(fontSize:20,letterSpacing:4)),
                  ),
                  icon: Icon(
                    Icons.bookmark_add,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[600],
                    onPrimary: Colors.white,
                    onSurface: Colors.grey, // the button will takes this color when it is muted
                  ),
                ),
              ),
              ],
        )
    ));
  }
}