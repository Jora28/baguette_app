import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/widgets/breakfast_slider.dart';
import 'package:baguette_app/core/widgets/category_card.dart';
import 'package:baguette_app/features/all_products/data/category_model.dart';
import 'package:baguette_app/features/all_products/data/get_customer_model.dart';
import 'package:baguette_app/features/all_products/domain/category.dart';
import 'package:baguette_app/features/all_products/presentation/bloc/categorybloc_bloc.dart';
import 'package:baguette_app/features/sign_up/data/custumer_model.dart';
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

  // String email;
  // String password;

  void getUserSecurety() async {
    // var getEmail = await UserSecureStorage().getEmail();
    // var getPassword = await UserSecureStorage().getPassword();
    // Users user = await Api().authServise.getUserData();
    // if (mounted)
    //   setState(() {
    //     email = getEmail;
    //     password = getPassword;
    //     users = user;
    //   });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "BreakFast",
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                BasicDemo(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "All Products",
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                          itemCount: widget.listCategory.length,
                          itemBuilder: (context, index) {
                            var data = widget.listCategory[index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: Duration(milliseconds: 500),
                              child: SlideAnimation(
                                horizontalOffset: 400,
                                child: GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ProductsPage(data.id),
                                      //         settings: RouteSettings(
                                      //             arguments: data)));
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
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Container(
                      child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(8),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/baguette.png"),
                          )),
                      Container(
                          child: Text(widget.getCustomerModel.name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)))
                    ],
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 15, top: 10),
                      child: Row(
                        children: [
                          Container(
                              child: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                            size: 25,
                          )),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                widget.getCustomerModel.email,
                                style: TextStyle(
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
                Container(
                    child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => SettingPage()));
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.settings,
                            color: Colors.black,
                            size: 25,
                          )),
                    ),
                    Text("Settings",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ],
                )),
                InkWell(
                  onTap: () async {
                    // await AuthServise().logout();
                    context.router.push(SignInPageRoute());
                  },
                  child: Container(
                      child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 25,
                          )),
                      Text("Log out",
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
    return Container(
      child: Row(
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  _isSideMenuOpen = !_isSideMenuOpen;
                });
              },
            ),
          ),
          Container(
              child: Text(
            "Baguette & Co.",
            style: TextStyle(fontSize: 18),
          )),
        ],
      ),
    );
  }
}
