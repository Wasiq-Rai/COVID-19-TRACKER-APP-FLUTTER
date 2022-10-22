import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FeeCheck extends StatefulWidget {
  static String starting_fee='10000';
  static String ending_fee='200000';

   FeeCheck({Key? key}) : super(key: key);

  get endingFeeController => TextEditingController();

  @override
  State<FeeCheck> createState() => _FeeCheckState();
}

class _FeeCheckState extends State<FeeCheck> {
  var startingFeeController = TextEditingController();
  var endingFeeController = TextEditingController();
  static var start = false;
  static var end = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {

                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                      controller: ModalScrollController.of(context),
                      child: bottomSheet(
                          context:context,
                          controller:startingFeeController,
                          text:'Staring range of fee',
                          hintText:'10000',
                          lable:'Starting Range',
                          )),
                ).then((value){
                  setState(() {
                    this.startingFeeController.text == value;
                    FeeCheck.starting_fee=this.startingFeeController.text;
                  });
                });;

              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    border: Border.all(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text(startingFeeController.text.isNotEmpty?startingFeeController.text.toString():'Starting Range'),
              ),
            ),
            ),
            GestureDetector(

                onTap: () {



                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => bottomSheet(
                        context:context,
                        controller:endingFeeController,
                        text:'Ending range of fee',
                        hintText: '200000',
                        lable:'Ending Range'),

                  ).then((value){
                    setState(() {
                      this.endingFeeController.text == value;
                      FeeCheck.ending_fee=this.endingFeeController.text;
                    });
                  });


                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      border: Border.all(color: Colors.green, width: 1.0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(endingFeeController.text.isNotEmpty
                          ? endingFeeController.text.toString()
                          : 'Ending Range')),
                ))
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class bottomSheet extends StatefulWidget {
  final BuildContext context; final TextEditingController controller;
  final String text; final String hintText; final String lable;
  const bottomSheet({Key? key,required this.context, required this.controller, required this.text, required this.hintText, required this.lable}) : super(key: key);

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  FeeCheck feeCheck = FeeCheck();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              Text(widget.text),
              TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  label: Text(widget.lable),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                    onPressed: () {

                      setState(() {



                      });
                      Navigator.pop(context);



                    },
                    icon: Icon(Icons.save),
                    label: Text('Save')),
              )
            ],
          )),
    );
  }
}
