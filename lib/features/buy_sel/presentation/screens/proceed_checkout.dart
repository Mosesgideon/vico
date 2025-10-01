import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/custom_button.dart';
import 'package:vico/common/widgets/custom_dialogs.dart';
import 'package:vico/common/widgets/error_widget.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/di/injector.dart';
import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/features/account/data/repo_impl/profile_repo_impl.dart';
import 'package:vico/features/account/domain/repo/profile_repo.dart';
import 'package:vico/features/account/presentations/bankbloc/bank_bloc.dart';

class ProceedCheckout extends StatefulWidget {
  final String amount;
  const ProceedCheckout({super.key, required this.amount});

  @override
  State<ProceedCheckout> createState() => _ProceedCheckoutState();
}

class _ProceedCheckoutState extends State<ProceedCheckout> {
  final acc = BankBloc(ProfileRepositoryImpl(NetworkService()));
  @override
  void initState() {
    // TODO: implement initState
    acc.add(GetCompanyAccontEvent());
    super.initState();
  }

  final picke = ImagePicker();
  XFile? myfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f172a),
      appBar: CustomAppBar(
        bgColor: Color(0xff0f172a),
        fgColor: Colors.grey,
        tittle: TextView(
          text: "Complete your purchase",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<BankBloc, BankState>(
          bloc: acc,
          listener: _listenToBankState,
          builder: (context, state) {
            if (state is BankAccountfailiureState) {
              // CustomDialogs.showLoading(context);
              return Center(child: AppPromptWidget());
            }
            if (state is CompanyAccountSuccessState) {
              logger.w(state.response.data);
              final accdetails = state.response.data;
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: TextView(
                        text:
                            "Please send only the sum of ₦${widget.amount} to the account below. Do not send more or less than this amount.",
                        color: Colors.grey,
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: "Bank Details",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: "Account Name:",
                                color: Colors.grey,
                              ),
                              TextView(
                                text: accdetails?.account?.name ?? '',
                                color: Colors.white,
                              ),
                            ],
                          ),
                          5.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: "Account Number:",
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  TextView(
                                    text: accdetails?.account!.number ?? '',
                                    color: Colors.white,
                                  ),
                                  5.horizontalSpace,
                                  InkWell(
                                    onTap: (){
                                      FlutterClipboard.copy(
                                          accdetails?.account!.number ?? '',
                                      ).then((onValue){
                                        CustomDialogs.showToast("Account number copied");
                                      });
                                    },
                                    child: Icon(
                                      Icons.copy_rounded,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          5.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(text: "Bank Name:", color: Colors.grey),
                              TextView(
                                text: accdetails?.account?.bank ?? '',
                                color: Colors.white,
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Divider(),
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: "Amount to Pay:",
                                color: Colors.grey,
                              ),
                              TextView(
                                text: "₦${widget.amount}",
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrange.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: TextView(
                        text:
                            "Ensure to take a screenshot/snapshot of the transfer confirmation page and upload it below for verification.",
                        color: Colors.yellowAccent.withOpacity(0.5),
                        fontSize: 11,
                      ),
                    ),
                    30.verticalSpace,
                    myfile != null
                        ? Container(
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  2.horizontalSpace,
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        myfile = null;
                                      });
                                    },

                                    child: Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(myfile!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        : InkWell(
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
                                  text: "Click to upload receipt image",
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
                    CustomButton(
                      child: TextView(
                        text: "Confirm",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Future<void> _takeimage() async {
    var pickimagge = await picke.pickImage(source: ImageSource.gallery);
    if (pickimagge == null) return;
    setState(() {
      myfile = pickimagge;
    });
  }

  void _listenToBankState(BuildContext context, BankState state) {
    if (state is BankAccountLoaingState) {
      CustomDialogs.showLoading(context);
    }
    if (state is BankAccountfailiureState) {
      // CustomDialogs.showLoading(context);
      context.pop();
    }
    if (state is CompanyAccountSuccessState) {
      logger.w(state.response.data);
      context.pop();
    }
  }
}
