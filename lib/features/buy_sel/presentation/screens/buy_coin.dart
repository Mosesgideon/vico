import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/features/buy_sel/presentation/screens/proceed_crypto.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/outlined_form_field.dart';
class BuyCoin extends StatefulWidget {
  final String name;
  final String rate;
  final String assetId;
  const BuyCoin({super.key, required this.name, required this.rate, required this.assetId});

  @override
  State<BuyCoin> createState() => _BuyCoinState();
}

class _BuyCoinState extends State<BuyCoin> {
  final numberController=TextEditingController();
  final addressController=TextEditingController();
  final key=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    numberController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final amount= ((double.tryParse(numberController.text.trim()) ?? 0) *
        (double.tryParse(widget.rate.toString()) ?? 0))
        .toStringAsFixed(2);
    return  Scaffold(
      backgroundColor: Color(0xff0f172a),
      appBar: CustomAppBar(
        fgColor: Colors.grey,
        bgColor: Color(0xff0f172a),
        tittle: TextView(text: "Buy ${widget.name.toString()}",fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white,),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      TextView(text: "Amount in USD", color: Colors.grey),
                      TextView(text: "*", color: Colors.red),
                    ],
                  ),
                  OutlinedFormField(
                    hint: "0.0",
                    controller: numberController,
                    validator:
                    MultiValidator([
                      RequiredValidator(errorText: 'This field is required'),
                    ]).call,
                    preffix: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: TextView(
                        text: "\$",
                        color: Colors.grey,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      TextView(text: "Your Ethereum Wallet Address", color: Colors.grey),
                      TextView(text: "*", color: Colors.red),
                    ],
                  ),
                  OutlinedFormField(
                    hint: "paste your${widget.name} address here",
                    controller: addressController,
                    validator:
                    MultiValidator([
                      RequiredValidator(errorText: 'This field is required'),
                    ]).call,
                 
                  ),10.verticalSpace,
                  TextView(text: "Warning: Ensure this is a Ethereum wallet address to avoid loss of funds",fontSize: 11,fontWeight: FontWeight.w500,color: Colors.yellow,),
                  30.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: "Rate:",
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      TextView(
                        text: "${widget.rate.toString()} per \$1",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: "You will pay:",
                        color: Colors.grey,
                        fontSize: 15,
                      ),

                      TextView(
                        text: "₦${((double.tryParse(numberController.text.trim()) ?? 0) *
                            (double.tryParse(widget.rate.toString()) ?? 0))
                            .toStringAsFixed(2)}",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
            CustomButton(child: TextView(text: "Continue Payment",color: Colors.white,fontWeight: FontWeight.w600,), onPressed: (){

              Navigator.push(context, CupertinoPageRoute(builder: (ctx)=>ProceedCrypto(amount: amount, wallet: addressController.text.trim(), crrency: widget.name, usdAmount: numberController.text.trim(), assetId: widget.assetId.toString(), paymentProof: '',)));
            }),
            100.verticalSpace
          ],
        ),
      ),
    );
  }
}
