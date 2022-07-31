import 'package:loc26/list/carsList.dart';
import 'package:loc26/widgets/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'caracteristique.dart';

class Overview extends StatefulWidget {

  const Overview({ Key? key }) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'LOC26',
      home: 
      Scaffold(
           appBar: MyAppBar(),
            body: ListView.builder(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: allCars.cars.length,
              itemBuilder: (ctx, i) {
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
                                              Navigator.push(ctx,
                                              MaterialPageRoute(
                                                  builder: (BuildContext ctx) =>
                                                  Caracteristique(dispo:allCars.cars[i].dispo,color:allCars.cars[i].color,path:allCars.cars[i].path,
                                                                      price:allCars.cars[i].price,title:allCars.cars[i].title,brand:allCars.cars[i].brand, carb:allCars.cars[i].carburant,categorie: allCars.cars[i].categorie,)
                                                  )
                                                  );
                                              // Navigator.of(ctx).pushNamed('notif');
                                              },
                                             
                                    
                                    // onPressed: () {
                                      // Navigator.of(context).push(context,);
                                    //   Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => Caracteristique(dispo:allCars.cars[i].dispo,color:allCars.cars[i].color,path:allCars.cars[i].path,
                                    //   price:allCars.cars[i].price,title:allCars.cars[i].title,brand:allCars.cars[i].brand, carb:allCars.cars[i].carburant,categorie: allCars.cars[i].categorie,)),
                                    // );
                                    // },
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
                                //allCars.cars[i].dispo ? dispoColor= Colors.green : dispoColor=Colors.red,
                                allCars.cars[i].dispo ? 'disponible \u{2714}' : 'indisponible \u{274C}',
                                //semanticsLabel: dispoText,
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
),
  
    ),
    );
  }

}