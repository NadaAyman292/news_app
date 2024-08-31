import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/screens/search_tab.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDeatails extends StatelessWidget {
  static const String routeName = "newsDetails";
  const NewsDeatails({super.key});

  @override
  Widget build(BuildContext context) {
    var articale = ModalRoute.of(context)!.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(
          "assets/images/bg_image.png",
        )),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchTab());
                },
                icon: const Icon(Icons.search))
          ],
          iconTheme: const IconThemeData(color: Colors.white, size: 35),
          backgroundColor: Colors.green,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          title: const Text(
            "News Details",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                height: 250,
                imageUrl: articale.urlToImage ?? "",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(
                articale.source!.name ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black87),
              ),
              Text(
                articale.title ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87),
              ),
              Text(
                articale.description ?? "",
                maxLines: 3,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  articale.publishedAt!.substring(0, 10) ?? "",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.black87),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                articale.content ?? "",
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  _launchUrl(articale.url ?? "");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View Full Article",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
