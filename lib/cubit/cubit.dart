import 'package:dio_package_practice/cach_helper/cach_helper.dart';
import 'package:dio_package_practice/cubit/states.dart';
import 'package:dio_package_practice/dio_helper/dio_helper.dart';
import 'package:dio_package_practice/modules/business_screen.dart';
import 'package:dio_package_practice/modules/science_screen.dart';
import 'package:dio_package_practice/modules/sport_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> appBarTitle = [
    'Business',
    'Sport',
    'Science',
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavbarItem = const [
    BottomNavigationBarItem(
      label: 'Business',
      icon: Icon(
        Icons.business,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Sport',
      icon: Icon(
        Icons.sports,
      ),
    ),
    BottomNavigationBarItem(
      label: 'science',
      icon: Icon(
        Icons.science,
      ),
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  List<dynamic> business = [];

  // void getBusinessData() {
  //   emit(GetBusinessNewsLoading());
  //   DioHelper.getData(
  //     url: 'v2/top-headlines',
  //     query: {
  //       'country': 'eg',
  //       'category': 'business',
  //       'apiKey': 'cb9ddd41adeb4c268676aa8eba7270a1',
  //     },
  //   ).then((value) {
  //     business = value.data['articles'];
  //     print(business.toString());
  //     emit(GetBusinessNewsSuccess());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetBusinessNewsFailed(error));
  //   });
  // }
  void dioGetBusiness() {
    emit(GetBusinessNewsLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'a43dc80dfa014367b56d228c0cf30f18',
      },
    ).then((value) {
      business = value.data['articles'];
      emit(GetBusinessNewsSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetBusinessNewsFailed(error));
    });
  }

  List<dynamic> sport = [];

  void getSportData() {
    emit(GetSportNewsLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'a43dc80dfa014367b56d228c0cf30f18',
      },
    ).then((value) {
      sport = value.data['articles'];
      if (kDebugMode) {
        print(sport.toString());
      }
      emit(GetSportNewsSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetSportNewsFailed(error));
    });
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(GetScienceNewsLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'a43dc80dfa014367b56d228c0cf30f18',
      },
    ).then(
      (value) {
        science = value.data['articles'];
        emit(GetScienceNewsSuccess());
      },
    ).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetScienceNewsFailed(error));
    });
  }

  bool isDark = false;

  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CachHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeThemeMode());
      }).catchError((error) {
        print(error.toString());
      });
    }
  }
}
