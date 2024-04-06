import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_form_example/provider/form_provider.dart';

class NextPageResult extends StatefulWidget {
  const NextPageResult({super.key});

  @override
  State<NextPageResult> createState() => _NextPageResultState();
}

class _NextPageResultState extends State<NextPageResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show Data'),centerTitle: true,),
      body: Consumer<FormProvider>(
        builder: (context, value, child) {
          return Column(children: [
                            const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Form Results',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Name:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text( value.userName,),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                    height: 5,
                  ),
                     Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Gender:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(value.selectedItem.toString())
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Religion:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(value.religion)
                        ],
                      )
                    ],
                  ),
        
        ],);
        },

      ),

    );
  }
}