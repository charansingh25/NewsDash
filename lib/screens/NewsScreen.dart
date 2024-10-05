import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inshorts_clone/components/NewsCard.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<dynamic>> getData(String id) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://saurav.tech/NewsAPI/top-headlines/category/${id}/in.json'));

      // Log the status code and response body
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // Check if the response is successful
      if (response.statusCode == 200) {
        List<dynamic> articles = jsonDecode(response.body)['articles'];
        print(
            articles); // Debugging print statement to see if articles are fetched
        return articles;
      } else {
        throw Exception(
            "Failed to load news. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
      return []; // Return an empty list if there's an error
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String id = routeArgs['id'].toString();
    print(id);
    String title = routeArgs['title'].toString();

    // Future<List<dynamic>> getData() async {
    //   http.Response response;
    //   response = await http.get(Uri.parse(
    //       'https://saurav.tech/NewsAPI/top-headlines/category/${id}/in.json'));

    //   List<dynamic> articles = jsonDecode(response.body)['articles'];

    //   // Use print() instead of console.log() to print the output
    //   print(articles);
    //   return jsonDecode(response.body)['articles'];
    // }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: FutureBuilder(
              future: getData(id),
              builder: (context, snapshot) {
                // Handle the connection states
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Still loading
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } // Error fetching data
                else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String content =
                              snapshot.data![index]['content'] ?? "No content";
                          String title =
                              snapshot.data![index]['title'] ?? "No title";
                          String description = snapshot.data![index]
                                  ['description'] ??
                              "No description";
                          String url = snapshot.data![index]['urlToImage'] ??
                              ""; // Default to empty if no image

                          return NewsCard(
                              title: title,
                              description: description,
                              content: content,
                              imageUrl: url);
                        }),
                  );
                }
                return CircularProgressIndicator();
              }),
        ));
  }
}
