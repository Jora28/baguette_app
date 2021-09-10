import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/widgets/breakfast_slider.dart';
import 'package:baguette_app/core/widgets/category_card.dart';
import 'package:baguette_app/features/categories/data/category_model.dart';
import 'package:baguette_app/features/categories/data/get_customer_model.dart';
import 'package:baguette_app/features/categories/presentation/pages/settings_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:auto_route/auto_route.dart';

class AllProductsPageWidget extends StatefulWidget {
  final List<CategoryModel> listCategory;
  final GetCustomerModel getCustomerModel;

  const AllProductsPageWidget({
    Key? key,
    required this.listCategory,
    required this.getCustomerModel,
  }) : super(key: key);

  @override
  _AllProductsPageWidgetState createState() => _AllProductsPageWidgetState();
}

class _AllProductsPageWidgetState extends State<AllProductsPageWidget> {
  // List<Category> allProductList = [];
  late double screenWidth;
  late double screenHeight;
  final Duration duration = const Duration(milliseconds: 150);
  bool _isSideMenuOpen = true;
  //late CategoryblocBloc getCategoryBloc;

  // String email;
  // String password;

  // void getUserSecurety() async {
  //   // var getEmail = await UserSecureStorage().getEmail();
  //   // var getPassword = await UserSecureStorage().getPassword();
  //   // Users user = await Api().authServise.getUserData();
  //   // if (mounted)
  //   //   setState(() {
  //   //     email = getEmail;
  //   //     password = getPassword;
  //   //     users = user;
  //   //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
              body: Stack(
            children: [_sideMenu(), _body()],
          )),
        ),
        // if (isLoading) Center(child: CircularProgressIndicator())
      ],
    );
  }

  Widget _body() {
    return AnimatedPositioned(
      duration: duration,
      top: _isSideMenuOpen ? 0 : 0.1 * screenHeight,
      bottom: _isSideMenuOpen ? 0 : 0.1 * screenWidth,
      left: _isSideMenuOpen ? 0 : 0.6 * screenWidth,
      right: _isSideMenuOpen ? 0 : -0.4 * screenWidth,
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails dra) {
          setState(() {
            _isSideMenuOpen = !_isSideMenuOpen;
          });
        },
        child: Material(
          elevation: 10,
          child: AbsorbPointer(
            absorbing: _isSideMenuOpen ? false : true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appBar(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text(
                    "BreakFast",
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const BreakfastSliderWidget(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text(
                    "All Products",
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: widget.listCategory.length,
                          itemBuilder: (context, index) {
                            final data = widget.listCategory[index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                horizontalOffset: 400,
                                child: GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      // MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         ProductsPage(data.id),
                                      //     settings: RouteSettings(
                                      //         arguments: data)));
                                    },
                                    child: CategoryCard(
                                      name: data.name,
                                      image: data.image,
                                    )),
                              ),
                            );
                          })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sideMenu() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  SizedBox(
                      child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/baguette.png"),
                          )),
                      SizedBox(
                          child: Text(widget.getCustomerModel.name,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14)))
                    ],
                  )),
                  Container(
                      margin: const EdgeInsets.only(left: 15, top: 10),
                      child: Row(
                        children: [
                          const SizedBox(
                              child: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                            size: 25,
                          )),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                widget.getCustomerModel.email,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SettingPage()));
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Icon(
                            Icons.settings,
                            color: Colors.black,
                            size: 25,
                          )),
                    ),
                    const Text("Settings",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ],
                )),
                InkWell(
                  onTap: () async {
                    // await AuthServise().logout();
                    context.router.push(const SignInPageRoute());
                  },
                  child: SizedBox(
                      child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 25,
                          )),
                      const Text("Log out",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  _isSideMenuOpen = !_isSideMenuOpen;
                });
              },
            ),
          ),
          const Text(
            "Baguette & Co.",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
