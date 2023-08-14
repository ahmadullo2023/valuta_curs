import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/services/app_service.dart';
import '../date/repository.dart';
import '../models/conv_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ApiRepository repository;
  String value0 = "USD";
  String value1 = "USD";
  bool isCheek = false;

  List<ConvertedModel> convertedList = [];

  void getAllCurrency() async {
    convertedList = await repository.getAllModel();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    repository = PostRepository(APIService());
    getAllCurrency();
  }

@override
Widget build(BuildContext context) {

  return Scaffold(
    backgroundColor: Color(0xFFEAEAFE),
    body: convertedList == null
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : Center(
          child: Column(
      children: [
        const SizedBox(height: 65),
          const Text("Currency Converter", style: TextStyle(color: Color(0xFF1F2261), fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          const Text("Check live retes, set rate alert, receive\n            notifications and more.", style: TextStyle(color: Colors.grey, fontSize: 20),),
          const SizedBox(height: 65),
          Container(
            height: 280,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                color: Colors.white
            ),
            child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 15),
                child: Text("Amount", style: TextStyle(color: Colors.grey, fontSize: 17),),
              ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            DropdownButton(
                              underline: const SizedBox.shrink(),
                              value: isCheek == true ? value0 : value1,
                              icon: const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.chevron_right),
                              ),
                              items: convertedList!.map(
                                    (e) {
                                  String currency = e.ccy!;
                                  String currencyShort = currency
                                      .substring(0, 2)
                                      .toLowerCase();
                                  return DropdownMenuItem(
                                    value: currency,
                                    child: SizedBox(
                                      // height: 123,
                                      width: 123,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: CircleFlag(
                                          currencyShort,
                                          size: 40,
                                        ),
                                        title: Text(currency),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? value) {
                                value0 = value!;
                                setState(() {});
                              },
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 40,
                              width: 130,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                minLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.greenAccent, width: 5.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              const Align(
                alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.center,
               child: GestureDetector(
                 onTap: (){
                   setState(() {
                     isCheek =! isCheek;
                     print(isCheek);
                   });
                 },
                 child: Container(
                   height: 50,
                   width: 50,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(25),
                     color: Colors.indigo,
                   ),
                   child: Image.asset("assets/images/Group.png"),
                 ),
               ),
             ),
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 175),
                child: Text("Converted Amount", style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 205),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    DropdownButton(
                      underline: const SizedBox.shrink(),
                      value: isCheek == false ? value0 : value1,
                      icon: const RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.chevron_right),
                      ),
                      items: convertedList!.map(
                            (e) {
                          String currency = e.ccy!;
                          String currencyShort = currency
                              .substring(0, 2)
                              .toLowerCase();
                          return DropdownMenuItem(
                            value: currency,
                            child: SizedBox(
                              // height: 123,
                              width: 123,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleFlag(
                                  currencyShort,
                                  size: 40,
                                ),
                                title: Text(currency),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (String? value) {
                        value1 = value!;
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 10),
                   SizedBox(
                     width: 130,
                     height: 40,
                     child: TextField(
                       keyboardType: TextInputType.number,
                       maxLines: 1,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                        ),
                      ),
                    ),
                  ],
                 ),
               ),
             ],
            ),
          ),
        ],
      ),
     )
   );
 }
}
