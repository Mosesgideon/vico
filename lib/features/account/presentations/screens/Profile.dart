import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vico/common/widgets/custom_appbar.dart';
import 'package:vico/common/widgets/custom_button.dart';
import 'package:vico/common/widgets/custom_dialogs.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/di/injector.dart';
import 'package:vico/core/navigation/route_url.dart';
import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/features/authentication/data/data/repo_impl/authrepositoryimpl.dart';
import 'package:vico/features/authentication/presentations/authbloc/auth_bloc.dart';
import 'package:vico/features/authentication/presentations/user_bloc/user_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/error_widget.dart';
import '../../../../common/widgets/info_dialog.dart';
import '../../../../core/services/data/session_manager.dart';
import '../../../../core/utils/helper_utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bgColor: Color(0xff101828),
      tittle: TextView(text: "Profile",fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white,),
      leading: SizedBox(),),
      backgroundColor:  Color(0xff101828),
   body: Padding(
     padding: const EdgeInsets.all(16.0),
     child: Column(
       children: [
         Center(child: Column(
           children: [
             CircleAvatar(radius: 50,),
             4.verticalSpace,
             TextView(text: "mosesgideon072@gmail.com",color: Colors.white,)
           ],
         )),
         40.verticalSpace,
         ProfileItem(widget: Icon(Iconsax.user,color: Colors.grey,), text: 'View profile', ontap: () {
           context.pushNamed(PageUrl.my_profile);
         },),
         ProfileItem(widget: Icon(Iconsax.security,color: Colors.grey,), text: 'Security', ontap: () {  },),
         ProfileItem(widget: Icon(Iconsax.bank,color: Colors.grey,), text: 'Bank Account', ontap: () {  },),
         ProfileItem(
           widget: Icon(
             Iconsax.logout,
             // size: 17,
             color: Colors.red,
           ),
           text: 'Logout',
           ontap: () {
             _logout(context);
             // context.pushNamed(PageUrl.mypro);
           },
         ),
       ],
     ),
   ),
    );
  }


  void _logout(BuildContext context) async {
    //to  logout
    SessionManager().logOut();
    CustomDialogs.showCustomDialog(
      barrierDismissible: false,
      InfoDialog(
        footer: Padding(
          padding: const EdgeInsets.all(16.0),
          child: 0.horizontalSpace,
        ),
        tittle: "Signing Out",
        subtittle: "You will be redirected to the login page in a few seconds",
      ),
      context,
    );
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed(PageUrl.signin_screen);
    });
  }
}

class ProfileItem extends StatefulWidget {
  final Widget widget;
  final String text;
  final VoidCallback ontap;

  const ProfileItem({
    super.key,
    required this.widget,
    required this.text,
    required this.ontap,
  });

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widget.widget,
                10.horizontalSpace,
                TextView(
                  text: widget.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
