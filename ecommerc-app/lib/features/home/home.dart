import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/features/setting/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Language/locale_keys.g.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/color.dart';
import '../../core/functions/user_responsive.dart';
import '../../view/wedget/custom_appbar.dart';
import 'units/home_drawer.dart';
import '../favorite/favorite.dart';
import 'home_view.dart';
import '../card/card.dart';
class Home extends StatefulWidget {
  static String id = "Home";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int index = 0 ;
  final List _screen = [
    const HomePage(),
    const FavoritePage(),
    const OrderDetails(),
    const Setting(),
  ];
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Provider.of<UserDarkTheme>(context).isDark? null  : AppColor.background,
        resizeToAvoidBottomInset: false,
        drawer: HomeDrawer(drawerKey : key),
        key: key,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value ;
            });
          },
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.grey,
          showUnselectedLabels: false,
          iconSize: 25.sp,
          showSelectedLabels: false,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: UserResponsive.get(
                      context: context,
                      mobile: 15.sp,
                      tablet: 17.sp
                  ),
                ),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,
                  size: UserResponsive.get(
                      context: context,
                      mobile: 15.sp,
                      tablet: 17.sp
                  ),
                ),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_outlined,
                  size: UserResponsive.get(
                      context: context,
                      mobile: 15.sp,
                      tablet: 17.sp
                  ),
                ),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_sharp,
                  size: UserResponsive.get(
                      context: context,
                      mobile: 15.sp,
                      tablet: 17.sp
                  ),
                ),
                label: ""
            ),
          ],
        ),
        body: Column(
          children: [
            getHomeAppBar(
              index : index,
              key : key,
              context: context ,
            ),
            ModalProgressHUD(
                inAsyncCall: false,
                progressIndicator:
                SpinKitFadingCircle(color: AppColor.primaryColor,),
                child: Expanded(child: _screen[index])
            )
          ],
        ),
      ),
    );
  }
  getTitle(index){
    switch(index){
      case 1 :
        return LocaleKeys.favorite.tr();
      case 2 :
        return LocaleKeys.orderDetail.tr();
      case 3 :
        return LocaleKeys.setting.tr();
      default :
        return LocaleKeys.home.tr();
    }
  }
  getLeading(index){
    switch(index){
      case 1 :
      case 2 :
      case 3 :
        return const BackButton(color: Colors.black,);
      default :
        return IconButton(
            onPressed: (){
              key.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu , color: Colors.black,size: 20.sp,)
        );
    }
  }
  getTail(index , context ){
    switch(index){
      case 1 :
      case 3 :
        return Container();
      case 2 :
        return IconButton(
            onPressed: (){},
            icon: Icon(Icons.help , color: Provider.of<UserDarkTheme>(context).isDark? AppColor.white : Colors.black,size: 20.sp,)
        );
      default :
        return
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search , color: Provider.of<UserDarkTheme>(context).isDark? AppColor.white : Colors.black,size: 20.sp,)
          );
    }
  }
}
