import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vico/common/widgets/text_view.dart';
import 'package:vico/core/services/data/session_manager.dart';

import '../../common/widgets/image_widget.dart';
import '../../core/navigation/route_url.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> dialogKey = GlobalKey<FormState>();

  late Animation<double> animation;
  AnimationController? animationCtrl;

  @override
  void initState() {
    super.initState();
    animationCtrl = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(
        parent: animationCtrl!,
        curve: Curves.easeIn,
      ),
    );

    animationCtrl?.forward();
    animation.addListener(() async {
      if (animation.isCompleted ?? false) {
        _goToNextScreen();
      }
    });
  }

  // final userbloc = injector.get<UserBloc>();
  @override
  void dispose() {
    super.dispose();
    dialogKey.currentState?.dispose();
  }
  // AuthSuccessResponse? response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: SizedBox(
          width: 250,
          height: 80,
          child: TextView(text: "Vico App",fontSize: 20,fontWeight: FontWeight.w600,),
        ),
      ),
    );
  }

  void _goToNextScreen() {
    if (SessionManager().isLoggedIn) {
      context.goNamed(PageUrl.signin_screen);
    } else {
      context.goNamed(PageUrl.signin_screen);
    }
}
}
