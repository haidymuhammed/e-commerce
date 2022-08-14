import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Language/codegen_loader.g.dart';
import 'controller/AsyncCall.dart';
import 'controller/ChangeLanguage/language_cubit.dart';
import 'controller/DarkTheme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          BlocProvider (create: (_) => ChangeLanguageCubit()),
          ChangeNotifierProvider(create: (_) => AsyncCall()),
          ChangeNotifierProvider(create: (_) => UserDarkTheme()),
        ],
        child: EasyLocalization(
            supportedLocales: const [Locale('en'), Locale('ar')],
            saveLocale: true,
            path: 'asset/Language', // <-- change the path of the translation files
            fallbackLocale: const Locale('en'),
            assetLoader: const CodegenLoader(),
            child: const MyApp()
        ),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
              brightness: Provider.of<UserDarkTheme>(context).isDark ? Brightness.dark : Brightness.light
          ),
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          home: const Home(),
        );
      }
    );
  }
}
