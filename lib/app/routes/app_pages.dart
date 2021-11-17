import 'package:get/get.dart';

import 'package:ladder/app/modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import 'package:ladder/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:ladder/app/modules/change_profile/bindings/change_profile_binding.dart';
import 'package:ladder/app/modules/change_profile/views/change_profile_view.dart';
import 'package:ladder/app/modules/chat/bindings/chat_binding.dart';
import 'package:ladder/app/modules/chat/views/chat_view.dart';
import 'package:ladder/app/modules/chat_room/bindings/chat_room_binding.dart';
import 'package:ladder/app/modules/chat_room/views/chat_room_view.dart';
import 'package:ladder/app/modules/detail_tukang/bindings/detail_tukang_binding.dart';
import 'package:ladder/app/modules/detail_tukang/views/detail_tukang_view.dart';
import 'package:ladder/app/modules/home/bindings/home_binding.dart';
import 'package:ladder/app/modules/home/views/home_view.dart';
import 'package:ladder/app/modules/introduction_screen/bindings/introduction_screen_binding.dart';
import 'package:ladder/app/modules/introduction_screen/views/introduction_screen_view.dart';
import 'package:ladder/app/modules/login/bindings/login_binding.dart';
import 'package:ladder/app/modules/login/views/login_view.dart';
import 'package:ladder/app/modules/order/bindings/order_binding.dart';
import 'package:ladder/app/modules/order/views/order_view.dart';
import 'package:ladder/app/modules/pilih_tukang/bindings/pilih_tukang_binding.dart';
import 'package:ladder/app/modules/pilih_tukang/views/pilih_tukang_view.dart';
import 'package:ladder/app/modules/profile/bindings/profile_binding.dart';
import 'package:ladder/app/modules/profile/views/profile_view.dart';
import 'package:ladder/app/modules/search/bindings/search_binding.dart';
import 'package:ladder/app/modules/search/views/search_view.dart';

// import 'package:ladder/app/modules/service_detail/bindings/service_detail_binding.dart';
// import 'package:ladder/app/modules/service_detail/views/service_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION_SCREEN,
      page: () => IntroductionScreenView(),
      binding: IntroductionScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PROFILE,
      page: () => ChangeProfileView(),
      binding: ChangeProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    // GetPage(
    //   name: _Paths.SERVICE_DETAIL,
    //   page: () => ServiceDetailView(),
    //   binding: ServiceDetailBinding(),
    // ),
    GetPage(
      name: _Paths.PILIH_TUKANG,
      page: () => PilihTukangView(),
      binding: PilihTukangBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TUKANG,
      page: () => DetailTukangView(),
      binding: DetailTukangBinding(),
    ),
  ];
}
