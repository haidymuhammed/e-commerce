import 'package:badges/badges.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/CustomerTheme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/functions/user_responsive.dart';
import '../../data/model/product.dart';
class ProductWidget extends StatefulWidget {
  Product product ;
  ProductWidget({Key? key , required this.product}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          /*
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductScreen(product: product)
              )
          );
           */
        },
        child: Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Badge(
            badgeColor: AppColor.primaryColor.withOpacity(0.5),
            position: const BadgePosition(
                top: 5,
                start: 5
            ),
            elevation: 0,
            badgeContent: InkWell(
                onTap: () async {
                  try{
                    //await FavoriteCubit.get(context).deleteFromFavorite(product );
                  }
                  catch(e){

                  }
                },
                child: Center(
                  child:  Icon(
                    Icons.favorite ,
                    color: Colors.red,
                    size: 12,
                  ),
                )
            ),
            child: Column(
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
                            child: Image.network(widget.product.image , fit: BoxFit.fill,)
                        );
                      }
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
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.product.name,
                                  style: UserTheme.get(
                                      context: context,
                                      fontSize: 13.sp,
                                      fontWight: FontWeight.w700,
                                      colorDark: AppColor.white,
                                      colorBright: AppColor.black
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        "0 EGP",
                                        style: UserTheme.get(
                                            context: context,
                                            fontSize: 13.sp,
                                            fontWight:
                                            FontWeight.w700,
                                            colorDark: AppColor.primaryColor,
                                            colorBright: AppColor.primaryColor
                                        )
                                    ),
                                    Text(" EGP",
                                        style: UserTheme.get(
                                            context: context,
                                            fontSize: 13.sp,
                                            fontWight:
                                            FontWeight.w700,
                                            colorDark: null,
                                            colorBright: null))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 3.sp),
                            height: UserResponsive.get(
                                context: context,
                                mobile: 30.sp,
                                tablet: 20.sp),
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
                                  tablet: 12.sp),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        )
    );
  }
}
