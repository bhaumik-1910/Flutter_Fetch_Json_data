import 'package:counter_app/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  List<Post>? posts;
  var isLoading = false;

  Future<List<Post>?> getPost() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await getPost();
    if (posts != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 112, 59, 209),
        centerTitle: true,
        title: Text(
          'Fetch JSON data from API',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (contest, index) {
            return Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    myRow("Id :",(posts![index].id.toString())),
                    myRow("Name :",(posts![index].name)),
                    myRow("UseName :",(posts![index].username)),
                    myRow("Email :",(posts![index].email)),
                    myRow("City :",(posts![index].address.city)),
                    myRow("Street :",(posts![index].address.street)),
                    myRow("Zipcode :",(posts![index].address.zipcode)),
                    myRow("Phone :",(posts![index].phone)),
                    myRow("Website :",(posts![index].website)),
                    myRow("Company Name:",(posts![index].company.name)),
                    // myRow("CompanyPhrase:",(posts![index].company.catchPhrase)),
                    myRow("Company BS:",(posts![index].company.bs)),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Row myRow(String name, data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        Text(data,style: TextStyle(fontSize: 15)),
      ],
    );
  }
}
