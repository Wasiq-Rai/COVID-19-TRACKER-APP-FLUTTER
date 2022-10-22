import 'package:Campus_Finder/view_model/CitiesList.dart';
import 'package:Campus_Finder/view_model/departmnetsList.dart';
import 'package:Campus_Finder/view_model/feeCheck.dart';
import 'package:Campus_Finder/view_model/publicPrivateCheck.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'UniversityInfo.dart';

class ResultUniversity extends StatefulWidget {
  var status_of_university;
  var city;
  var starting_fee;
  var ending_fee;
  ResultUniversity({Key? key,this.status_of_university='Private',this.city='Lahore',this.starting_fee='10000',this.ending_fee='200000'}) : super(key: key);

  @override
  State<ResultUniversity> createState() => _ResultUniversityState();
}

class _ResultUniversityState extends State<ResultUniversity> {



  final database= FirebaseDatabase.instance.ref('campus');
  String universities_count='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: database.onValue,
            builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){

              if( !snapshot.hasData ){
                return Expanded(
                  child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context,index){
                        return Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white30,


                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.white

                                  ),
                                  title: Container(
                                      height: 20,
                                      width: 89,
                                      color: Colors.white
                                  ),
                                  subtitle: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white
                                  ),

                                ),
                              ],
                            )
                        );
                      }

                  ),
                );

              }
              else  {
                List<dynamic> list  =[];
                list.clear();
                // Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                list= snapshot.data!.snapshot.value as dynamic;
                //
                list = list.toList();

                return Expanded(

                  child: ListView.builder(
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context, index) {
                        final title = list[index]['name'].toString();
                        universities_count=snapshot.data!.snapshot.children.length.toString();
                        if(( widget.city==list[index]['city'].toString() && widget.status_of_university=='Both') ){
                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex:1,
                                          child: Image(
                                            image: AssetImage('assets/img.png'),
                                          )),
                                      Expanded(
                                          flex:2,
                                          child: Stack(
                                            children: [

                                              UniversityCard(
                                                  name: list[index]['name'].toString(),
                                                  admission: list[index]['admission'].toString(),
                                                  status: list[index]['status'].toString(), 
                                                  city: list[index]['city'].toString(), 
                                                  fee: list[index]['fee'].toString()),
                                              Container(

                                                decoration: BoxDecoration(
                                                  boxShadow:[BoxShadow(
                                                      blurRadius: 25.0
                                                  )] ,


                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                                  color: Colors.redAccent
                                                ),
                                                width: 250,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Text(list[index]['name'].toString(),style: TextStyle(
                                                    color: Colors.white
                                                  ),textAlign: TextAlign.end,),
                                                ),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>UniversityInfo(list: list,index: index,)));
                                },
                              ),
                              Divider(
                                thickness: 2.0,

                              )
                            ],
                          );
                        }
                         if((widget.city==list[index]['city'].toString() &&  widget.status_of_university=='Both'&&  int.parse(widget.starting_fee)<=int.parse(list[index]['fee'].toString())&& int.parse(widget.ending_fee)>=int.parse(list[index]['fee'].toString())) ){
                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex:1,
                                          child: Image(
                                            image: AssetImage('assets/img.png'),
                                          )),
                                      Expanded(
                                          flex:2,
                                          child: Stack(
                                            children: [

                                              UniversityCard(
                                                  name: list[index]['name'].toString(),
                                                  admission: list[index]['admission'].toString(),
                                                  status: list[index]['status'].toString(),
                                                  city: list[index]['city'].toString(),
                                                  fee: list[index]['fee'].toString()),
                                              Container(

                                                decoration: BoxDecoration(
                                                    boxShadow:[BoxShadow(
                                                        blurRadius: 25.0
                                                    )],

                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                                    color: Colors.redAccent
                                                ),
                                                width: 250,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Text(list[index]['name'].toString(),style: TextStyle(
                                                      color: Colors.white
                                                  ),textAlign: TextAlign.end,),
                                                ),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>UniversityInfo(list: list,index: index,)));
                                },
                              ),
                              Divider(
                                thickness: 2.0,

                              )
                            ],
                          );
                        }
                        else if((widget.city==list[index]['city'].toString() &&  widget.status_of_university==list[index]['status'].toString()&&  int.parse(widget.starting_fee)<=int.parse(list[index]['fee'].toString())&& int.parse(widget.ending_fee)>=int.parse(list[index]['fee'].toString())) ){
                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex:1,
                                          child: Image(
                                            image: AssetImage('assets/img.png'),
                                          )),
                                      Expanded(
                                          flex:2,
                                          child: Stack(
                                            children: [

                                              UniversityCard(
                                                  name: list[index]['name'].toString(),
                                                  admission: list[index]['admission'].toString(),
                                                  status: list[index]['status'].toString(),
                                                  city: list[index]['city'].toString(),
                                                  fee: list[index]['fee'].toString()),
                                              Container(

                                                decoration: BoxDecoration(
                                                    boxShadow:[BoxShadow(
                                                        blurRadius: 25.0
                                                    )],

                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                                    color: Colors.redAccent
                                                ),
                                                width: 250,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Text(list[index]['name'].toString(),style: TextStyle(
                                                      color: Colors.white
                                                  ),textAlign: TextAlign.end,),
                                                ),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>UniversityInfo(list: list,index: index,)));
                                },
                              ),
                              Divider(
                                thickness: 2.0,

                              )
                            ],
                          );
                        }
                        else
                          return Container();





                      }






                  )
                );



              }

            },


          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Universities in: '+CityList.city),
      ),
    );
  }
}

class UniversityCard extends StatelessWidget {
  final String name,
      
      admission,
      status,
      
      city,
      
      fee;
  const UniversityCard({Key? key, required this.name, required this.admission, required this.status, required this.city, required this.fee}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: Colors.white24,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Status: '), Expanded(child: Text(status))]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Fee: '), Expanded(child: Text(fee))]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Admission: '), Text(admission)]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Location: '), Text(city)]),
              Divider(),
              
            ],
          ),
        ),
      ),
    );
  }
}

