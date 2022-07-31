import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loc26/list/carsList.dart';
import 'package:loc26/pages/caracteristique.dart';
import 'package:loc26/pages/notification.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return 
          AppBar(
          toolbarHeight:80 ,
          title: Text('LOC26',
          style:TextStyle(fontWeight: FontWeight.bold, fontSize: 25, 
           letterSpacing: 10,fontFamily: 'Lobster',color:Colors.white,),
          ),
          actions: [
             IconButton(
              onPressed:(){
                showSearch(context:context , delegate:DataSearch());
              },
              icon:Icon(Icons.search),
              ),
            Container(
              margin:EdgeInsets.only(right:12.0),
              child: IconButton(
              onPressed: () {
                 Navigator.push(context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Notif()
                              
                              )
                              );
              }, 
              icon: Icon(CupertinoIcons.bell,),
              ),
            ),
            ],

      );
  }
   @override
  Size get preferredSize => new Size.fromHeight(80);
}

class DataSearch extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query='';
      }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back) , onPressed:(){
      close(context,null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('') ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filtersCar = allCars.cars.where((element) => element.title.contains(query)).toList();
    return ListView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: allCars.cars.length,
      itemBuilder: (context,i){
        return GestureDetector(
          onTap:()=>Navigator.push(context,
          MaterialPageRoute(
          builder: (BuildContext ctx) =>
          Caracteristique(dispo:allCars.cars[i].dispo,color:allCars.cars[i].color,path:allCars.cars[i].path,
          price:allCars.cars[i].price,title:allCars.cars[i].title,brand:allCars.cars[i].brand, carb:allCars.cars[i].carburant,categorie: allCars.cars[i].categorie,)
          )
          ),
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.car_rental),
              title: query==''? Text(allCars.cars[i].title,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20)):
              Text('${filtersCar[i]}'.toString(),style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
              subtitle: Text(    allCars.cars[i].dispo ? 'disponible \u{2714}' : 'indisponible \u{274C}',
                                  style:TextStyle(fontSize: 13,fontWeight: FontWeight.bold,
                                  color:allCars.cars[i].dispo ? Colors.green : Colors.red,fontStyle:FontStyle.italic)),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        );
      }
      );
  


    //return Center(child: Text('Chercher une voiture .. '));
  }
  
}
/*
  ListView.builder(
      itemCount:allCars.cars.length,
      itemBuilder:(context,i){
        return Card(
                  elevation: 4,
                  margin:EdgeInsets.fromLTRB(15, 8, 15,8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
              Text(allCars.cars[i].brand,style:TextStyle(fontWeight: FontWeight.bold , fontSize: 15,fontStyle:FontStyle.italic,color:Colors.grey,letterSpacing:5)),
              Text(allCars.cars[i].title,style:TextStyle(fontWeight: FontWeight.bold , fontSize: 20,)),
                             Padding(
                               padding: const EdgeInsets.only(top:20.0),
                               child: Row(
                                 children: [
                                   Text((allCars.cars[i].price).toString()+' DH',style:TextStyle(color: Colors.deepOrange[600],fontWeight:FontWeight.bold,fontSize:25)),
                                   Text(' Par Jour'),
                                 ],
                               ),
                             ),
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: OutlinedButton(
                                    
                                    onPressed: (){
                                              Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext ctx) =>
                                                  Caracteristique(dispo:allCars.cars[i].dispo,color:allCars.cars[i].color,path:allCars.cars[i].path,
                                                                      price:allCars.cars[i].price,title:allCars.cars[i].title,brand:allCars.cars[i].brand, carb:allCars.cars[i].carburant,categorie: allCars.cars[i].categorie,)
                                                  )
                                                  );
                                              },
                                    child: Text('Voir ses caractéristiques'),
                                    style: OutlinedButton.styleFrom(
                                      primary: Colors.purple,
                                      side: BorderSide(
                                        color: Colors.blue, 
                                        
                                      ),),),
                              ),
                              Container(
                                margin:EdgeInsets.only(top:5,left:15),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                                  
                              child:Text(
                                allCars.cars[i].dispo ? 'disponible \u{2714}' : 'indisponible \u{274C}',
                                style:TextStyle(fontSize: 10,fontWeight: FontWeight.bold,
                                color:allCars.cars[i].dispo ? Colors.green : Colors.red,fontStyle:FontStyle.italic)),
                                ),
                                
                          ],
                          ),
                          
                        ),
                        
                       Column(
                            children: [
                               Hero(tag: allCars.cars[i].title,
                                 child: Image.asset(allCars.cars[i].path,width:130,)
                                 ),
                            ],
                          ),
                      ],
                    ), 
      
    );
  },
      
      
      );*/