
import 'package:api_tester/utils/json_beautifier.dart';
import 'package:api_tester/widgets/custom_button.dart';
import 'package:api_tester/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../repository/api_repo.dart';
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  String data="";
  String requestType = "";
  TextEditingController endPointUrl = TextEditingController();
  TextEditingController baseUrl = TextEditingController();
  List<String> selected = [];
  bool pressed = false;
  TextEditingController body = TextEditingController();
  Map<String, Color> requestTypeColor = {
    'GET': Colors.orangeAccent.shade100,
    'POST': Colors.greenAccent.shade200,
    'PUT': Colors.blue.shade100,
    'DELETE': Colors.red.shade100,
    'PATCH': Colors.purple.shade200,
  };
  bool forPostOrPut = false;
  @override
  void dispose() {
    super.dispose();
    endPointUrl.dispose();
    baseUrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Icon(
            Icons.api,
            size: 30,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text('WELCOME'),
                        SizedBox(width: 10),
                        Text(
                          'PULSERS,',
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('TEST YOUR API\'s'),
                    const SizedBox(height: 30),
                    CustomTextfield(
                      headingText: 'Enter Base URL:',
                      inputText: baseUrl,
                      hintText: "https://api.example.com/",
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      headingText: 'Enter End Point:',
                      inputText: endPointUrl,
                      hintText: "/user",
                    ),
                    const SizedBox(height: 20),
                    const Text('Select Request Type:',
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          'GET',
                          'POST',
                          'PUT',
                          'DELETE',
                          'PATCH',
                        ]
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      selected.clear();
                                      selected.add(e);
                                      print(e);
                                      if(e == 'POST' || e == 'PUT'){
                                        setState(() {
                                          forPostOrPut = true;
                                        });
                                      }
                                      else{
                                        setState(() {
                                          forPostOrPut = false;
                                        });
                                      }
                                      setState(() {
                                        requestType = e;
                                        data = "";
                                      });
                                    },
                                    child: Chip(
                                      label: Text(e),
                                      backgroundColor: selected.contains(e)
                                          ? requestTypeColor[e]
                                          : Colors.tealAccent,
                                      elevation: 0,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    forPostOrPut ? CustomTextfield(headingText: 'Enter Body:', hintText: ''
                        '{'"name" ':' "Puslse API" ',\n'
                        "status" ':' "good"
                        '}', inputText: body, height: 100,) : const Text(''),
                    const SizedBox(height: 20),
                   data !='' ? data != 'error' ? JsonBeautifier(data: data)  :
                   const Center(child:  Text('404 Not Found',
                     style: TextStyle(color: Colors.red),)) :
                   const Text(''),
                  ],
                ),
                const SizedBox(height: 20),
                 SafeArea(
                    child: GestureDetector(
                      onTap: ()async {
                          if (requestType == 'GET') {
                            print(baseUrl.text + endPointUrl.text);
                            var data1 = await ApiRepo().getData(baseUrl.text , endPointUrl.text);
                            setState(() {
                              data = data1;
                            });
                          }
                          if (requestType == 'POST') {
                             dynamic data1 = {
                              'Name': 'Put request 2 update ','Author': 'Test author 2','Publication': 'Publication test 2',
                            } as dynamic;
                            var data2 = await ApiRepo().postData(baseUrl.text , endPointUrl.text,body.text.trim());
                            setState(() {
                              data = data2;
                            });
                          }
                          if (requestType == 'PUT') {
                            var data2 = await ApiRepo().putData(baseUrl.text , endPointUrl.text, body.text.trim());
                            setState(() {
                              data = data2;
                            });
                          }
                          if (requestType == 'DELETE') {
                             var data1 = await ApiRepo().deleteData(baseUrl.text , endPointUrl.text);
                            setState(() {
                              data = data1;
                            });
                          }
                        },
                      child: const Center(
                          child: CustomButton(
                                      buttonText: 'Send Request',
                                    )),
                    )),
              ],
            ),
          ),
        ));
  }
}
