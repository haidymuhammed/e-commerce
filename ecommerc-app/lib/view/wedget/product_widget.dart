import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Language/locale_keys.g.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/color.dart';
import '../../core/functions/CustomerTheme.dart';
import '../../core/functions/user_responsive.dart';
class ProductWidget extends StatelessWidget {
  Product product ;
  ProductWidget({Key? key , required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){  },
      child: Container(
        padding: EdgeInsets.all(2.sp),
        margin: EdgeInsets.all(5.sp),
        height:UserResponsive.get(
            context: context,
            mobile: UserResponsive.height(context) * 0.3,
            tablet: UserResponsive.height(context) * 0.35
        ),
        decoration: BoxDecoration(
            color: Provider.of<UserDarkTheme>(context).isDark? Colors.grey.shade800 :  Colors.white,
            borderRadius: BorderRadius.circular(10.sp)
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: LayoutBuilder(
                  builder: (context , constrains) {
                    return SizedBox(
                        width: constrains.maxWidth,
                        height: constrains.maxHeight,
                        child: Image.network(product.image , fit: BoxFit.fill,)
                    );
                  }
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(6.sp),
                child: Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: UserTheme.get(
                    context: context,
                    fontSize: UserResponsive.get(
                        context: context,
                        mobile: 13.sp,
                        tablet: 10.sp
                    ),
                    fontWight: FontWeight.w700,
                    colorBright: AppColor.black,
                    colorDark: AppColor.white,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${product.price}",
                                  style: UserTheme.get(
                                    context: context,
                                    fontSize: UserResponsive.get(
                                        context: context,
                                        mobile: 13.sp,
                                        tablet: 10.sp
                                    ),
                                    fontWight: FontWeight.w700,
                                    colorDark: AppColor.primaryColor,
                                    colorBright:  AppColor.primaryColor,
                                  ),
                                ),
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  " "+ LocaleKeys.egp.tr(),
                                  style: UserTheme.get(
                                      context: context,
                                      fontSize: UserResponsive.get(
                                          context: context,
                                          mobile: 13.sp,
                                          tablet: 10.sp
                                      ),
                                      fontWight: FontWeight.w700,
                                      colorDark: null,
                                      colorBright: null
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 3.sp),
                            height: UserResponsive.get(
                                context: context,
                                mobile: 30.sp,
                                tablet: 20.sp
                            ),
                            width: UserResponsive.get(
                                context: context,
                                mobile: 30.sp,
                                tablet: 20.sp
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(3.sp),
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.white,
                              size: UserResponsive.get(
                                  context: context,
                                  mobile: 15.sp,
                                  tablet: 12.sp
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
