import 'package:get/get.dart';
import 'package:shoe_ecommerce/pages/bottom_navi/bindings/main_bindings.dart';
import 'package:shoe_ecommerce/pages/bottom_navi/view_main/view_main.dart';
import 'package:shoe_ecommerce/pages/cart/bindings/cart_binding.dart';
import 'package:shoe_ecommerce/pages/cart/view_cart/cart_page.dart';
import 'package:shoe_ecommerce/pages/home/viewss/home_view.dart';
import 'package:shoe_ecommerce/pages/search/bindings/search_binding.dart';
import 'package:shoe_ecommerce/pages/search/viewss/view_search.dart';
import 'package:shoe_ecommerce/routes/routes.dart';

class Pages {
  static final List<GetPage<dynamic>> pages = [
    GetPage<HomePage>(
      name: Routes.initial,
      page: () => const Main(),
      binding: MainBindings(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),

    //---Home---//
    GetPage<HomePage>(
      name: Routes.home,
      page: () => HomePage(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),

    //---Search---//
    GetPage<SearchPage>(
      name: Routes.search,
      page: () => const SearchPage(),
      binding: SearchBinding(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),

    //----CartPage---//
    GetPage<CartPage>(
      name: Routes.cart,
      page: () => CartPage(),
      binding: CartBindings(),
      transition: Transition.upToDown,
      preventDuplicates: true,
    ),
  ];
}
