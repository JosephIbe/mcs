import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_ui/common/constants/size_constants.dart';
import 'package:news_ui/common/constants/text_constants.dart';

import 'package:news_ui/presentation/widgets/articles_list.dart';

import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  dynamic width, height;
  var activeTabIndex = 0;

  late TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: Sizes.dimen_0,
          leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.menu_sharp, color: Colors.black87,),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications, color: Colors.black87,),
            ),
          ],
        ),
        body: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(Sizes.dimen_15),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: width - Sizes.dimen_50,
                        height: Sizes.dimen_50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10)),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_10, vertical: Sizes.dimen_5),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              color: Colors.blueGrey.withOpacity(.5),
                            ),
                            suffixIcon: IconButton(
                              onPressed: (){},
                              icon: const Icon(Iconsax.search_normal4),
                            )
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: Sizes.dimen_15,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: Sizes.dimen_45,
                        height: Sizes.dimen_50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10)),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.equalizer),
                      ),
                    ),
                  ],
                ),
                /**
                 *  Tabs
                 * **/
                SizedBox(
                  width: width,
                  height: Sizes.dimen_50,
                  child: TabBar(
                    tabs: const [
                      Tab(text: TextLiterals.forYou,),
                      Tab(text: TextLiterals.creativity,),
                      Tab(text: TextLiterals.uiDesign,),
                      Tab(text: TextLiterals.arts,),
                      Tab(text: TextLiterals.productivity,),
                      Tab(text: TextLiterals.sports,),
                    ],
                    onTap: (tabIndex) => setState(() => activeTabIndex = tabIndex),
                    controller: tabController,
                    indicatorColor: Colors.deepPurpleAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: Sizes.dimen_3,
                      ),
                    ),
                    labelColor: Colors.black87,
                    isScrollable: true,
                  ),
                ),
                const SizedBox(height: Sizes.dimen_20,),
                SizedBox(
                  height: height - Sizes.dimen_140,
                  // height: height,
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      ArticlesList(),
                      Center(child: Text('Creativity'),),
                      Center(child: Text('UI/UX Design'),),
                      Center(child: Text('Arts & Culture'),),
                      Center(child: Text('Productivity'),),
                      Center(child: Text('Sports'),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}