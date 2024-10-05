import 'package:flutter/material.dart';
import 'package:inshorts_clone/components/CategoryCart.dart';
import '../model/Category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<CategoryScreen> {
  final List<Category> category = [
    Category(
        title: 'Business', id: 'business', imageUrl: "lib/assets/business.jpg"),
    Category(
        title: 'Entertainment',
        id: 'entertainment',
        imageUrl: "lib/assets/entertainment.jpg"),
    Category(title: 'General', id: 'general', imageUrl: "lib/assets/general.jpg"),
    Category(title: 'Health', id: 'health', imageUrl: "lib/assets/health.png"),
    Category(title: 'Science', id: 'science', imageUrl: "lib/assets/science.png"),
    Category(title: 'Sports', id: 'sports', imageUrl: "lib/assets/sports.jpg"),
    Category(
        title: 'Technology',
        id: 'technology',
        imageUrl: "lib/assets/technology.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: category.length, // Set the itemCount to avoid the RangeError
            itemBuilder: (context, index) {
              final cat = category[index];
              return Categorycart(
                  title: cat.title, id: cat.id, imageUrl: cat.imageUrl);
            },
          )),
    );
  }
}
