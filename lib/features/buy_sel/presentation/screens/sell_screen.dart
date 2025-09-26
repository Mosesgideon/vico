import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/custom_button.dart';
import 'package:vico/common/widgets/outlined_form_field.dart';
import 'package:vico/common/widgets/text_view.dart';
class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final pickimage=ImagePicker();
  XFile? myfile;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
      fgColor:  Colors.grey,
      bgColor:  Color(0xff0f172a),
    ),
      backgroundColor: Color(0xff0f172a),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        TextView(text: "Sell Yor Gift Card",fontSize: 20,color: Colors.white,),
              20.verticalSpace,
              Row(
                children: [
                  TextView(text: "Amount in USD",color: Colors.grey,),
                  TextView(text: "*",color: Colors.red,),
                ],
              ),
              OutlinedFormField(hint: "0.0",preffix: CircleAvatar(backgroundColor: Colors.transparent,
                  child: TextView(text: "\$",color: Colors.grey,fontSize: 25,)),),
              15.verticalSpace,
              Row(
                children: [
                  TextView(text: "Gift Card Number",color: Colors.grey,),
                  TextView(text: "*",color: Colors.red,),
                ],
              ),
              OutlinedFormField(hint: "0.0",preffix: CircleAvatar(backgroundColor: Colors.transparent,
                  child: TextView(text: "\$",color: Colors.grey,fontSize: 25,)),),
              15.verticalSpace,
              Row(
                children: [
                  TextView(text: "Receive Payment To",color: Colors.grey,),
                  TextView(text: "*",color: Colors.red,),
                ],
              ),
              OutlinedFormField(hint: "0.0",preffix: CircleAvatar(backgroundColor: Colors.transparent,
                  child: TextView(text: "\$",color: Colors.grey,fontSize: 25,)),),

              15.verticalSpace,
              Row(
                children: [
                  TextView(text: "Upload Card Image",color: Colors.grey,),
                  TextView(text: "*",color: Colors.red,),
                ],
              ),
              10.verticalSpace,
             myfile!=null?Container(
               height: 100,
               width: 1.sw,
               padding: EdgeInsets.all(15),
               decoration:  BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   border: Border.all(color: Colors.grey),
                 image: DecorationImage(image: AssetImage(myfile!.path),fit: BoxFit.cover)
               ),
             ): InkWell(
                onTap: (){
                  _takeimage();
                },
                child: Container(
                  width: 1.sw,
                  padding: EdgeInsets.all(15),
                  decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)

                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file_outlined,color: Colors.grey,size: 30,),
                      2.verticalSpace,

                      TextView(text: "Click to upload image",color: Colors.grey,),
                      2.verticalSpace,
                      TextView(text: "PNG , JPG, JPEG",color: Colors.grey,)
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(text: "Current Rate:",color: Colors.grey,fontSize: 15,),
                  TextView(text: "2000 per \$1",color: Colors.white,fontSize: 18,)
                ],
              ),
              4.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(text: "You will receive:",color: Colors.grey,fontSize: 15,),
                  TextView(text: "N0.00",color: Colors.white,fontSize: 18,)
                ],
              ),
              30.verticalSpace,

              CustomButton(child: TextView(text: "Sell Card",color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15,), onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }

  void _takeimage() async{

    final imagefiles=await pickimage.pickImage(source: ImageSource.gallery);

    if (imagefiles == null) return;

    setState(() {
      myfile = imagefiles;
    });

  }
}
