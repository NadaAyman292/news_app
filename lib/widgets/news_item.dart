import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/screens/news_deatails.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDeatails.routeName,
            arguments: articles);
      },
      child: Container(
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              height: 250,
              imageUrl: articles.urlToImage ?? "",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // ClipRRect(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(25),
            //       topRight: Radius.circular(25),
            //     ),
            //     child: Image.network(
            //       articles.urlToImage ?? "",

            //     )),
            Text(
              articles.author ?? "",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black87),
            ),
            Text(
              articles.title ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87),
            ),
            Text(
              articles.description ?? "",
              maxLines: 3,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black87),
            ),
            Text(
              articles.publishedAt!.substring(0, 10) ?? "",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
