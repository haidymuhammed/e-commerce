part of '../home_view.dart';
class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: UserResponsive.get(
            context: context,
            mobile: UserResponsive.height(context) * 0.19,
            tablet: UserResponsive.height(context) * 0.23
        ),
        padding: EdgeInsets.all(5.sp),
        child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                },
                child: CategoryWidget(
                  category: Category(
                    id: "",
                    image: AppImageAsset.networkTestImage,
                    name: "Tablet",
                  ),
                ),
              );
            }
        )
    );
  }
}
