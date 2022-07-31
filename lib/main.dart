import 'package:dio_package_practice/cach_helper/cach_helper.dart';
import 'package:dio_package_practice/cubit/cubit.dart';
import 'package:dio_package_practice/cubit/states.dart';
import 'package:dio_package_practice/dio_helper/dio_helper.dart';
import 'package:dio_package_practice/layout/news_layout/newslayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'blocobserver.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CachHelper.init();
  BlocOverrides.runZoned(() {
    bool? isDark =  CachHelper.getBoolean(key: 'isDark');
    print(isDark);
    runApp(MyApp(isDark!));
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..dioGetBusiness()
            ..getSportData()
            ..getScienceData()
            ..changeThemeMode(fromShared: isDark),
        )
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          bool mode = cubit.isDark;
          return MaterialApp(
            theme: ThemeData(),
            darkTheme: ThemeData(
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              appBarTheme: AppBarTheme(
                elevation: 0,
                color: HexColor('#333739'),
                systemOverlayStyle: SystemUiOverlayStyle(
                  systemStatusBarContrastEnforced: true,
                  statusBarColor: HexColor('#333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              scaffoldBackgroundColor: HexColor('#333739'),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('#333739'),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.deepPurpleAccent,
                elevation: 100,
              ),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
