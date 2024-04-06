import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_form_example/provider/form_provider.dart';
import 'package:provider_form_example/screen/next_page_result.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController=TextEditingController();
  var result='';
  
  @override
  Widget build(BuildContext context) {
    // final dataProvider=Provider.of<FormProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Data By Provider'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<FormProvider>(
            builder: ((context, value, child) {
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextFormField(
                 autofocus: false,
                 decoration: const InputDecoration(
                   hintText: 'Enter Name ',
                   prefixIcon: Icon(Icons.person),
                   border: OutlineInputBorder(),
                   errorStyle: TextStyle(
                     color: Colors.redAccent,
                     fontSize: 15,
                   ),
                 ),
                 controller: nameController,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please Enter Name';
                   }
                   return null;
                 },
               ),
                                 const SizedBox(height: 15),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      // isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Gender',
                      style: TextStyle(fontSize: 14),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select Gender.';
                      }
                      return null;
                    },
                    items: value.genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (saveValue) {
                     result=   saveValue.toString();
                    },
                  ),
                  const SizedBox(height: 15),
                                    Row(
                                      children: <Widget>[
                                        const SizedBox(
                                          width: 10,
                                        ), 
                                        const Text(
                                          'Muslim',
                                          style: TextStyle(fontSize: 17.0),
                                        ), //Text
                                        const SizedBox(width: 10),
                                        Checkbox(
                                          value: value.selectedMuslim,
                                          onChanged: (onValue) {
                                            
                                              print('onchanged Muslim :  $onValue');
                                              value.selectedMuslim = onValue!;
                                              value.toggleCheckbox(2);
 
                                            
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Non Muslim',
                                          style: TextStyle(fontSize: 17.0),
                                        ), //Text
                                        const SizedBox(width: 10),
                                        Checkbox(
                                          value: value.selectedNonMuslim,
                                          onChanged: (onValue) {
                                            
                                              print('onchanged Non Muslim :  $onValue');
                                              value.selectedNonMuslim = onValue!;
                                              value.toggleCheckbox(2);

                                           
                                          },
                                        ),
                                      ],
                                    ),
               const SizedBox(height: 15,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: InkWell(
                          onTap: (){
                            value.addUserName(nameController.text);
                            value.setSelectGender(result.toString());
                            value.religionData();
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextPageResult(),
                          ),
                        );
                            
                            // dataProvider.addUserName(nameController.text);
                          // context.read<GetDataProvider>().addUserName(newUserName: nameController.text)
                            // authProvider.name
                            // print(authProvider.name);
                          },
                          child: const Text('Submit'))),
                      ),
                                        const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                                      const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By Using Provider Results',
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
                            Text(
                              value.userName,
                              // dataProvider.userName,
                              // print(dataProvider.userName),
                              // Text(context.watch<GetDataProvider>().userName.toString()),
                            // Text(context.watch<GetDataProvider>().userName),
            
                            )
                            
            
                          ],
                        
                        ),
                    

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
                  const SizedBox(height: 30,),
                  Center(
                    child: TextButton(onPressed: (){
                                                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextPageResult(),
                          ),
                        );


                    }, child: Text('Send Data'))
                  ),
                      //                   Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     color: Colors.orange,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Center(child: InkWell(
                      //     onTap: (){
                      //       value.addUserName(nameController.text);
                      //       value.setSelectGender(result.toString());
                      //       value.religionData();
                      //         Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => NextPageResult(),
                      //     ),
                      //   );
                            
                      //     },
                      //     child: const Text('Send Data'))),
                      // ),


             
            ],
                      );
            }),
        
          ),
        ),
      );
  }
}