import 'package:flutter/material.dart';
class PublicPrivateRadioButtons extends StatefulWidget {
   static String status_of_university='Both';
   PublicPrivateRadioButtons({Key? key}) : super(key: key);

  @override
  State<PublicPrivateRadioButtons> createState() => _PublicPrivateRadioButtonsState();
}

class _PublicPrivateRadioButtonsState extends State<PublicPrivateRadioButtons> {
  String _radioVal ='Both';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Radio<String>(
          value: 'Public' ,
          groupValue: this._radioVal,
          onChanged: (String? val){
            if(val!=null){
              setState(() {
                this._radioVal=val;
                PublicPrivateRadioButtons.status_of_university=this._radioVal;

              });
            }
          }),
        Text('Public'),
        Radio<String>(
            value: 'Private' ,
            groupValue: this._radioVal,
            onChanged: (String? val){
              if(val!=null){
                setState(() {
                  this._radioVal=val;
                  PublicPrivateRadioButtons.status_of_university=this._radioVal;
                });
              }
            }),
        Text('Private'),
        Radio<String>(
            value: 'Both' ,
            groupValue: this._radioVal,
            onChanged: (String? val){
              if(val!=null){
                setState(() {
                  this._radioVal=val;
                  PublicPrivateRadioButtons.status_of_university=this._radioVal;

                });
              }
            }),
        Text('Both'),
    ],
    );
  }



}

