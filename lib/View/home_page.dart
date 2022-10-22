import 'package:Campus_Finder/View/ResultUniversity.dart';
import 'package:Campus_Finder/View/all_universities_screen.dart';
import 'package:Campus_Finder/res/components/round_button.dart';
import 'package:Campus_Finder/view_model/CitiesList.dart';
import 'package:Campus_Finder/view_model/departmnetsList.dart';
import 'package:Campus_Finder/view_model/feeCheck.dart';

import 'package:flutter/material.dart';

import '../view_model/publicPrivateCheck.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
bool _pinned = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5aa596).withOpacity(.8),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          centerTitle: true,
          pinned: this._pinned,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Campus Finder",

              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black)]),
            ),
            background: Image.asset(
              'assets/img.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent,
                      boxShadow: [
                        BoxShadow(
                           blurRadius: 2,
                          color: Colors.redAccent
                        )
                      ]
                    ),

                    child: Padding(
                        padding: EdgeInsets.all(10),child: Text('Check out Best universities in Pakistan',style:
                      TextStyle(
                        color: Colors.white,

                      ),))),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration:BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                 blurRadius: 2,

                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),

                                  color: Colors.black,
                                  
                              ),

                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Choose Department",style: TextStyle(color: Colors.white)),
                            )
                          ),
                          DepartmentsList(),
                        ],

                      ),
                    ),

                    Divider(),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      decoration:BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                 blurRadius: 2
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),

                                  color: Colors.black,

                              ),

                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Select City",style: TextStyle(color: Colors.white)),
                              )
                          ),
                          CityList(),
                        ],

                      ),
                    ),


                    Divider(),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      decoration:BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                 blurRadius: 2
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),

                                  color: Colors.black,
                      ),

                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Choose status of University",style: TextStyle(color: Colors.white)),
                              )
                          ),
                          PublicPrivateRadioButtons(),
                        ],

                      ),
                    ),


                    Divider(),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      decoration:BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                 blurRadius: 2
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),

                                  color: Colors.black,

                              ),

                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Range of Fee",style: TextStyle(color: Colors.white),),
                              )
                          ),
                          FeeCheck(),
                        ],

                      ),
                    ),

                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                        title: 'Check Universties',
                        onPress: () {
                          debugPrint(PublicPrivateRadioButtons.status_of_university);
                          debugPrint(CityList.city);
                          debugPrint(FeeCheck.starting_fee);
                          debugPrint(FeeCheck.ending_fee);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultUniversity(
                                    status_of_university: PublicPrivateRadioButtons.status_of_university,
                                    city: CityList.city,
                                  starting_fee: FeeCheck.starting_fee,
                                  ending_fee: FeeCheck.ending_fee,)));
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                        title: 'Check All Universities',
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllUniversities()));
                        }),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            )),
      ]),
    );
  }
}
