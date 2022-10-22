
import 'package:Campus_Finder/View/UniversityInfo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllUniversities extends StatefulWidget {
  const AllUniversities({Key? key}) : super(key: key);

  @override
  State<AllUniversities> createState() => _AllUniversitiesState();
}

class _AllUniversitiesState extends State<AllUniversities> {
  final GlobalKey<_AllUniversitiesState> _globalKey = GlobalKey<_AllUniversitiesState>();
  final database= FirebaseDatabase.instance.ref('campus');
  var  campus_controller= TextEditingController();


  String universities_count='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,

      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),child: TextFormField(

            controller: campus_controller,
            decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
            ),
            onChanged: (String value){
              setState(() {

              });
            },
          ),),

          StreamBuilder(
            stream: database.onValue,
            builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){

              if(!snapshot.hasData ){
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
              else {



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

                        if(campus_controller.text.isEmpty){



                          return Column(
                            children: [
                              InkWell(

                                child: ListTile(
                                  leading: Image(height: 50,
                                    width: 50,
                                    image: AssetImage('assets/img.png'),
                                  ) ,
                                  title: Text(title),
                                  subtitle: Text(list[index]['status'].toString()),
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
                        else if(title.toLowerCase().contains(campus_controller.text.toLowerCase().toString())){

                          return Column(
                            children: [
                              InkWell(
                                child: ListTile(
                                  leading: Image(height: 50,
                                    width: 50,
                                    image: AssetImage('assets/img.png'),
                                  ) ,
                                  title: Text(title),
                                  subtitle: Text(list[index]['status'].toString()),
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
                        }else{
                          return Container();
                        }



                      }
                      ),

                );




              }

            },


          ),
        ],
      ),
      appBar: AppBar(

        title: Text('Universities Found: '+universities_count),
      ),
    );
  }
}

// FirebaseAnimatedList(
// query: database,
// itemBuilder: (context,snapshot,animation,index){
// return ListTile(
// leading: Image(image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Funiversity-building&psig=AOvVaw22ZVj8H_YNxBx2S9hFXBBL&ust=1663871637134000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCODa_oHDpvoCFQAAAAAdAAAAABAD'),
// ),
// title: Text(snapshot.child('name').value.toString()),
// subtitle: Text(snapshot.child('status').value.toString()),
// );
//
// });