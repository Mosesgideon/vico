import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/navigation/route_url.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/custom_appbar.dart';
import '../../common/widgets/image_widget.dart';
import '../../core/constants/package_exports.dart';
import '../../core/di/injector.dart';
import '../../core/theme/pallets.dart';
import '../../gen/assets.gen.dart';
import '../cart/presentations/cartbloc/cart_bloc.dart';

final GlobalKey<ScaffoldState> baseScaffoldKey = GlobalKey<ScaffoldState>();

class BasePage extends StatefulWidget {
  const BasePage({
    super.key,
    this.passedIndex = 0,
    required this.navigationShell,
  });

  final int passedIndex;

  final StatefulNavigationShell navigationShell;

  @override
  State createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with WidgetsBindingObserver {
  final GlobalKey<FormState> dialogKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    mycart.add(GetCartEvent());
    // context.read<CartBloc>().add(GetCartEvent());
  }

  final mycart = injector.get<CartBloc>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dialogKey.currentState?.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    logger.i("APP STATE: $state");

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached)
      return;
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff101828),
      // appBar:
      //     widget.navigationShell.currentIndex == 3
      //         ? null
      //         : AppBar(
      //           centerTitle: false,
      //           title: SizedBox(
      //             width: 130,
      //             child: ImageWidget(imageUrl: "assets/images/pngs/logo.png"),
      //           ),
      //           actions: [
      //             InkWell(
      //               splashColor: Colors.transparent,
      //               onTap: () {
      //                 context.pushNamed(PageUrl.search_screen);
      //               },
      //
      //               child: Icon(
      //                 Iconsax.search_normal,
      //                 color: Color(0xffE67002),
      //               ),
      //             ),
      //             20.horizontalSpace,
      //           ],
      //         ),
      key: baseScaffoldKey,
      extendBody: true,
      body: widget.navigationShell,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _goBranch,
        elevation: 3,
        unselectedItemColor: Pallets.grey35,
        selectedItemColor: Color(0xffE67002),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor:Color(0xff101828),
        selectedLabelStyle: GoogleFonts.poppins(
          color: Pallets.mildBlue,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: IgnorePointer(child: Icon(Icons.home_outlined)),
            activeIcon: IgnorePointer(child: Icon(Icons.home_outlined)),
          ),
          BottomNavigationBarItem(
            label: 'Trade',
            icon: IgnorePointer(child: Icon(Icons.currency_exchange_outlined)),
            activeIcon: IgnorePointer(child: Icon(Icons.currency_exchange_outlined)),
          ),
          BottomNavigationBarItem(
            label: 'Transactions',
            icon: IgnorePointer(
              child:Icon(Iconsax.send),
            ),
            activeIcon: IgnorePointer(
              child: Icon(Iconsax.send),
            ),
          ),
          // BottomNavigationBarItem(
          //   label: 'Wishlist',
          //   icon: IgnorePointer(
          //       child:Icon(Icons.favorite_border)
          //   ),
          //   activeIcon: IgnorePointer(
          //       child: Icon(Icons.favorite_border)
          //   ),
          // ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: IgnorePointer(child: Icon(Iconsax.profile_tick5)),
            activeIcon: IgnorePointer(child: Icon(Iconsax.profile_tick5)),
          ),
        ],
      ),
    );
  }
}
