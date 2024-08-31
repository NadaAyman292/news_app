import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/main.dart';
import 'package:news_app/repo/home_local_repo_impl.dart';
import 'package:news_app/repo/home_remote_repo_impl.dart';
import 'package:news_app/widgets/news_item.dart';
import 'package:news_app/widgets/tab_item.dart';

class TabBarWidget extends StatelessWidget {
  String id;
  TabBarWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) =>
            HomeCubit(hasInternet ? HomeRemoteRepoImpl() : HomeLocalRepoImpl())
              ..getSources(id: id),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeGetSourcesLoadingsState ||
                state is HomeGetNewsDataLoadingsState) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state is ChangeSourseState) {
              HomeCubit.get(context).getSources(
                id: id,
              );
            }

            if (state is HomeGetSourcesErrorState) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("error"),
                        content: Text(state.error),
                      ));
            }
          },
          builder: (context, state) {
            if (state is HomeGetSourcesSuccessState ||
                state is HomeGetNewsDataSuccesssState) {
              return Column(
                children: [
                  DefaultTabController(
                    length: HomeCubit.get(context)
                            .sourseResponse
                            ?.sources
                            ?.length ??
                        0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                          tabAlignment: TabAlignment.start,
                          onTap: (value) {
                            HomeCubit.get(context).changeSourseIndex(value);
                          },
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          isScrollable: true,
                          tabs: HomeCubit.get(context)
                              .sourseResponse!
                              .sources!
                              .map((sourse) => TabItem(
                                    isSelected: HomeCubit.get(context)
                                            .sourseResponse!
                                            .sources!
                                            .elementAt(HomeCubit.get(context)
                                                .selectedSourceIndex) ==
                                        sourse,
                                    sources: sourse,
                                  ))
                              .toList()),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: HomeCubit.get(context)
                                .newsDataResponse
                                ?.articles
                                ?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return NewsItem(
                              articles: HomeCubit.get(context)
                                  .newsDataResponse!
                                  .articles![index]);
                        }),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );

//     return FutureBuilder(
//         future: ApiManager.getSourses(widget.id),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapshot.hasError) {
//             return Text("some thing error");
//           }
//           var sourses = snapshot.data?.sources ?? [];
//           return Column(
//             children: [
//               DefaultTabController(
//                   length: sourses.length,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TabBar(
//                         tabAlignment: TabAlignment.start,
//                         onTap: (value) {
//                           selectedTabIndex = value;
//                           setState(() {});
//                         },
//                         indicatorColor: Colors.transparent,
//                         dividerColor: Colors.transparent,
//                         isScrollable: true,
//                         tabs: sourses
//                             .map((sourse) => TabItem(
//                                   isSelected:
//                                       sourses.elementAt(selectedTabIndex) ==
//                                           sourse,
//                                   sources: sourse,
//                                 ))
//                             .toList()),
//                   )),
//               FutureBuilder(
//                   future: ApiManager.getNewsData(
//                       sourses[selectedTabIndex].id ?? ""),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     if (snapshot.hasError) {
//                       return Text("some thing error");
//                     }
//                     var articls = snapshot.data?.articles ?? [];
//                     return Expanded(
//                       child: ListView.builder(itemBuilder: (context, index) {
//                         return InkWell
//                         (
//                           onTap: (){

//                           },
//                           child: NewsItem(
//                             articles: articls[index],
//                           ),
//                         );
//                       }),
//                     );
//                   }),
//             ],
//           );
//         });
  }
}
