import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';

class SearchByLocation extends StatelessWidget {
  const SearchByLocation({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController =
        Provider.of<WeatherController>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 88, 66, 169),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).height /
                3, // Adjust the width as needed
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.black),
            //   borderRadius: BorderRadius.circular(5.0),
            // ),
            child: TextFormField(
              controller: weatherController.searchController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                iconColor: Colors.white,
                fillColor: const Color.fromARGB(255, 88, 66, 169),
                hintText: 'Search Cities...',
                hintStyle: const TextStyle(color: Colors.white),
                contentPadding:
                    const EdgeInsets.all(10.0), // Adjust the padding as needed
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    weatherController.searchController.clear();
                  },
                ),
              ),
              onChanged: (text) {
                // Handle text changes and perform search as you type.
                // You can implement your search logic here.
              },
            ),
          ),
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    WeatherController weatherController =
        Provider.of<WeatherController>(context);
    return FutureBuilder(
        future: weatherController.searchLocation(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No results found"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {}, title: Text(snapshot.data![index].name!));
              },
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
    // throw UnimplementedError();
  }
}
