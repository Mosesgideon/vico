import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/text_view.dart';
class ProceedCrypto extends StatefulWidget {
  final String amount;
  final String wallet;
  final String crrency;
  const ProceedCrypto({super.key, required this.amount, required this.wallet, required this.crrency});

  @override
  State<ProceedCrypto> createState() => _ProceedCryptoState();
}

class _ProceedCryptoState extends State<ProceedCrypto> {
  final picke=ImagePicker();
  XFile? myfile;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff0f172a),
      appBar: CustomAppBar(
        bgColor: Color(0xff0f172a),
        fgColor: Colors.grey,
        tittle: TextView(text: "Complete your purchase",fontSize: 18,fontWeight: FontWeight.w600,color:Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(0.1)

                  ),
                  child: TextView(text: "Please send exactly ₦${widget.amount} to the account below. Do not send more or less than this amount.",color: Colors.grey,fontSize: 12,)),
              20.verticalSpace,
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(0.1)

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(text: "Bank Details",color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(text: "Account Name:",color: Colors.grey,),
                          TextView(text: "Godwin Inyene",color: Colors.white,),
                        ],
                      ),
                      5.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(text: "Account Number:",color: Colors.grey,),
                          TextView(text: "8144098649",color: Colors.white,),
                        ],
                      ),
                      5.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(text: "Bank Name:",color: Colors.grey,),
                          TextView(text: "Opay",color: Colors.white,),
                        ],
                      ),
                      10.verticalSpace,
                      Divider(),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(text: "Amount to Pay:",color: Colors.grey,),
                          TextView(text: "₦${widget.amount}",color: Colors.white,fontWeight: FontWeight.w600,),
                        ],
                      ),

                    ],
                  )),
              20.verticalSpace,
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(0.1)

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(text: "Crypto Details",color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(text: "Cryptocurrency:",color: Colors.grey,),
                          TextView(text: widget.crrency,color: Colors.white,),
                        ],
                      ),
                      5.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(text: "Amount:",color: Colors.grey,),
                          TextView(text: widget.amount,color: Colors.white,),
                        ],
                      ),
                      5.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(text: "Receiving Wallet:",color: Colors.grey,),
                          TextView(text: widget.wallet,color: Colors.white,),
                        ],
                      ),

                    ],
                  )),
              20.verticalSpace,
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(0.1)

                  ),
                  child: TextView(text: "Ensure to take a screenshot/snapshot of the transfer confirmation page and upload it below for verification.",color: Colors.yellowAccent.withOpacity(0.5),fontSize: 11,)),
              30.verticalSpace,
              myfile!=null?Container(
                padding: EdgeInsets.only(top: 10),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        2.horizontalSpace,
                        InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              setState(() {
                                myfile=null;
                              });
                            },

                            child: Icon(Icons.cancel_rounded,color: Colors.grey,))
                      ],
                    ),
                    10.verticalSpace,
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage(myfile!.path,),fit: BoxFit.cover)

                      ),
                    ),
                  ],
                ),
              ):InkWell(
                onTap: () {
                  _takeimage();
                },
                child: Container(
                  width: 1.sw,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file_outlined,
                        color: Colors.grey,
                        size: 30,
                      ),
                      2.verticalSpace,

                      TextView(
                        text: "Click to upload image",
                        color: Colors.grey,
                      ),
                      2.verticalSpace,
                      TextView(
                        text: "PNG , JPG, JPEG",
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),


              40.verticalSpace,
              CustomButton(child: TextView(text: "Confirm",color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16,), onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _takeimage() async {
    var pickimagge=await picke.pickImage(source: ImageSource.gallery);
    if(pickimagge==null)return;
    setState(() {
      myfile=pickimagge;
    });
  }
}
