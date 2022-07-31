
class Car {
  late String name;
  late String type;
  late double? price;
  late String imgUrl;
  //late bool dispo; 
  Car({required this.name,required this.type,this.price,required this.imgUrl});
}
/*
class ListCars{
  List<Car> cars=[
    Car(
      name:'Dacia Logan',   // Illa bghti declari parameters bhal haka, dirhom wast {} named parametrs
      type:'Familial',
      price:150,
      imgUrl:'images/adcia.jpg'),
      Car(
      name:'Range Rover',
      type:'Sport',
      price:350,
      imgUrl:'images/range.jpg'),
      Car(
      name:'Renault Clio',
      type:'Familial',
      price:200,
      imgUrl:'images/clio.jpg'),
      Car(
      name:'Dacia Logan',
      type:'Familial',
      price:150,
      imgUrl:'images/adcia.jpg'),
      Car(
      name:'Dacia Logan',
      type:'Familial',
      price:150,
      imgUrl:'images/adcia.jpg'),
      Car(
      name:'Dacia Logan',
      type:'Familial',
      price:150,
      imgUrl:'images/adcia.jpg'),
      Car(
      name:'Dacia Logan',
      type:'Familial',
      price:150,
      imgUrl:'images/adcia.jpg'),
      Car(
      name:'Dacia Logan',
      type:'Familial',
      price:150,
      imgUrl:'images/adcia.jpg'),
      Car(
      name:'Dacia Logan',
      type:'Familial',
      price:150,
      imgUrl:'images/adcia.jpg'),
      Car(
      name:'Dacia Logan',
      type:'Familial',
      price:150,
      imgUrl:'images/adcia.jpg'),
  ];

}*/
CarsList allCars = CarsList(
  cars: [
  CarItem(
      title: 'Honda Civic',
      price: 250,
      color: 'Grise',
      carburant: 'Essence',
      categorie: 'Familial',
      brand: 'Honda',
      path: 'assets/car1.jpg'
      ,dispo:true),
  CarItem(
      title: 'Land Rover Evoque',
      price: 300,
      color: 'Grise',
      carburant: 'Diesel',
      categorie: 'Sport',
      brand: 'Land Rover',
      path: 'assets/car2.jpg',
      dispo:false),
  CarItem(
      title: 'Mercedes Benz SLS',
      price: 250,
      color: 'Rouge',
      carburant: 'Essence',
      categorie: 'Familial',
      brand: 'Mercedes',
      path: 'assets/car3.jpg',dispo:true),
  CarItem(
      title: 'Audi A6 2018',
      price: 350,
      color: 'Grise',
      carburant: 'Diesel',
      categorie: 'Sport',
      brand: 'Audi',
      path: 'assets/car4.jpg',dispo:true),
  CarItem(
      title: 'Jaguar XF',
      price: 500,
      color: 'Blache',
      carburant: 'Essence',
      categorie: 'Sport',
      brand: 'Jaguar',
      path: 'assets/car5.jpg',dispo:false),
  CarItem(
      title: 'BMW E-1',
      price: 400,
      color: 'Grise',
      carburant: 'Diesel',
      categorie: 'Familial',
      brand: 'BMW',
      path: 'assets/car6.jpg',dispo:true),
]);

class CarsList {
  List<CarItem> cars;

  CarsList({required this.cars});
}
class CarItem {
  final String title;
  final double price;
  final String path;
  final String color;
  final String carburant;
  final String categorie;
  final String brand;
  final bool dispo;

  CarItem(
      {required this.title,
      required this.price,
      required this.path,
      required this.color,
      required this.carburant,
      required this.categorie,
      required this.brand,
      required this.dispo 
    });
}
