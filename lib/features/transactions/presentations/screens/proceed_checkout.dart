
import 'package:flutter/material.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/di/injector.dart';
import 'package:vico/features/authentication/presentations/user_bloc/user_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class ProceedParams {
  String total;
  String subtotal;
  String discount;

  ProceedParams(this.total, this.subtotal, this.discount);
}

class ProceedCheckout extends StatefulWidget {
  final String total;
  final String subtotal;
  final String discount;
  const ProceedCheckout({
    super.key,
    required this.total,
    required this.subtotal,
    required this.discount,
  });

  @override
  State<ProceedCheckout> createState() => _ProceedCheckoutState();
}

class _ProceedCheckoutState extends State<ProceedCheckout> {


  String selectedPaymentMethod = '';
  bool showCryptoOptions = false;
  final userbloc = injector.get<UserBloc>();
  double? selectedDeliveryFee = 0;
  String? selectedDeliveryMethod;
  String? selectedDeliverystateId;
  String? selectedDeliveryStaionId;


  String? minShippingEnable;
  String? shippingMinAmount;

  bool get isReadyToUpload {
    final isLocationSelected =
        selectedDeliverystateId != null || selectedDeliveryStaionId != null;
    final isPaymentSelected = selectedPaymentMethod != null;
    final isCryptoValid =
        selectedPaymentMethod == "crypto"
            ? selectedWalletAddressId != null
            : true;
    return isLocationSelected && isPaymentSelected && isCryptoValid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final controller = TextEditingController();

  int? selectedCryptoIndex;

  String? selectedWalletAddress;
  String? selectedWalletAddressId;
  String? selectedWalletname;
  String formatNumberWithCommas(String number) {
    try {
      final parsedNumber = double.parse(number.replaceAll(',', ''));
      return parsedNumber
          .toStringAsFixed(0)
          .replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
    } catch (e) {
      return number;
    }
  }

  String? totalnumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        tittle: TextView(
          text: "Place Your Order",
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),

    );
  }


  void payforItem() {



  }




  }



