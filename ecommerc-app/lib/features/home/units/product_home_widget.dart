part of '../home_view.dart';

class ProductWidgetHome extends StatelessWidget {
  Product product;
  ProductWidgetHome({Key? key , required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: AppColor.background.withOpacity(0.6),
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
              showToastError(
                  msg: e.toString(),
                  state: ToastedStates.ERROR
              );
            }
          },
          child: Center(
            child:  Icon(
              Icons.favorite ,
              color: Colors.red,
              size: UserResponsive.get(
                  context: context,
                  mobile: 12.sp,
                  tablet: 13.sp
              ),
            ),
          )
      ),
      child: ProductWidget(product : product),
    );
  }
}
