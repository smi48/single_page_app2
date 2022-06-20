// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CardVisit extends StatefulWidget {
  const CardVisit({Key? key}) : super(key: key);

  @override
  State<CardVisit> createState() => _CardVisitState();
}

class _CardVisitState extends State<CardVisit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  double opacityValue = 0.0;
  String nameSurname = "";
  String department = "";
  bool isBorderRadius = true;
  List<bool> toogleList = [false, false, false, true];
  List<Color> colorList = [
    Colors.amber,
    Colors.blue,
    Colors.purple,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 75,
            ),
            buildImage(),
            buildSlider(),
            buildNameInput(),
            buildDepartmentInput(),
            buildSwitchButton(),
            buildToggleButtons(),
            SizedBox(
              height: 50,
            ),
            buildSubmitButtons(),
          ],
        ),
      ),
    );
  }

  Row buildSubmitButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(),
        ElevatedButton(onPressed: () {}, child: Text("Kaydet")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                opacityValue = 0.0;
                nameSurname = "";
                department = "";
                isBorderRadius = true;
                toogleList = [true, false, false, false];
                nameController.text = "";
                departmentController.text = "";
              });
            },
            child: Text("Temizle")),
        SizedBox(),
      ],
    );
  }

  ToggleButtons buildToggleButtons() {
    return ToggleButtons(
      children: [
        Container(
          width: 10,
          height: 10,
          color: Colors.amber,
        ),
        Container(
          width: 10,
          height: 10,
          color: Colors.blue,
        ),
        Container(
          width: 10,
          height: 10,
          color: Colors.purple,
        ),
        Container(
          width: 10,
          height: 10,
          color: Colors.green,
        ),
      ],
      isSelected: toogleList,
      borderColor: Colors.grey,
      onPressed: (value) {
        setState(() {
          for (var i = 0; i < toogleList.length; i++) {
            toogleList[i] = false;
          }
          toogleList[value] = true;
        });
      },
    );
  }

  Row buildSwitchButton() {
    return Row(
      children: [
        Switch(
            value: isBorderRadius,
            onChanged: (value) {
              setState(() {
                isBorderRadius = value;
              });
            }),
        Text("Kenarları Yuvarla")
      ],
    );
  }

  Container buildDepartmentInput() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: departmentController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Departman",
        ),
        onChanged: (value) {
          setState(() {
            department = "";
            department = value;
          });
        },
      ),
    );
  }

  Container buildNameInput() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "İsim Soyisim",
        ),
        controller: nameController,
        onChanged: (value) {
          setState(() {
            nameSurname = "";
            nameSurname = value;
          });
        },
      ),
    );
  }

  Slider buildSlider() {
    return Slider(
        min: 0.0,
        max: 1.0,
        value: opacityValue,
        onChanged: (value) {
          setState(() {
            opacityValue = value;
          });
        });
  }

  Stack buildImage() {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(isBorderRadius == true ? 10 : 0),
                color: toogleList[0] == true
                    ? colorList[0]
                    : toogleList[1] == true
                        ? colorList[1]
                        : toogleList[2] == true
                            ? colorList[2]
                            : colorList[3],
              ),
              child: Container(
                margin: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: CircleAvatar(
                  child: Image.network(
                    "https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(opacityValue),
              ),
            ),
          ],
        ),
        Positioned(
          child: Text(
            nameSurname,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom: 10,
          left: 10,
        ),
        Positioned(
          child: Text(
            department,
            style: TextStyle(color: Colors.white),
          ),
          bottom: 30,
          left: 10,
        ),
      ],
    );
  }
}
