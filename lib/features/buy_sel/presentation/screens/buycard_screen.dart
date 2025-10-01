import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/custom_button.dart';
import 'package:vico/common/widgets/text_view.dart';

import '../../../../common/widgets/outlined_form_field.dart';
class BuycardScreen extends StatefulWidget {
  final String text;
  final String rate;
  const BuycardScreen({super.key, required this.text, required this.rate});

  @override
  State<BuycardScreen> createState() => _BuycardScreenState();
}

class _BuycardScreenState extends State<BuycardScreen> {
  final numberController=TextEditingController();
  @override
  void initState() {
    super.initState();
    numberController.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff0f172a),

      appBar: CustomAppBar(
        bgColor:  Color(0xff0f172a),
        tittle: TextView(text: "${widget.text} Card",color: Colors.white,fontSize: 20,),
        fgColor: Colors.grey,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      TextView(text: "Amount in USDT", color: Colors.grey),
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

                  30.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: "Current Rate:",
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
                        text: "You will receive:",
                        color: Colors.grey,
                        fontSize: 15,
                      ),

                      TextView(
                        text: ((double.tryParse(numberController.text.trim()) ?? 0) *
                            (double.tryParse(widget.rate.toString()) ?? 0))
                            .toStringAsFixed(2),
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  30.verticalSpace,

                ],
              ),
            ),
            CustomButton(child: TextView(text: "Sell Card",color: Colors.white,fontWeight: FontWeight.w600,), onPressed: (){}),
            100.verticalSpace
          ],
        ),
      ),
    );
  }
}
