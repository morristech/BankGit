import 'package:bank_management/FirebaseFunctions/FirebaseFun.dart';
import 'package:bank_management/utils/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateBranch extends StatefulWidget {
  @override
  _CreateBranchState createState() => _CreateBranchState();
}

class _CreateBranchState extends State<CreateBranch> {
  var _fKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create',
          style: TextStyle(
            color: darkColor,
          ),
        ),
      ),
      body: Form(
        key: _fKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/sun.png',
                height: size.height / 8,
                width: size.height / 8,
              ),
              SizedBox(
                height: size.height / 20,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Branch Name*",
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Name can\'t be empty';
                  } else if (value.length > 10) {
                    return 'Minimum length for name is 10';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: desController,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: "Description",
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Description can\'t be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: size.height / 20,
              ),
              FlatButton(
                onPressed: () {
                  if (_fKey.currentState.validate()) {
                    createBranch(nameController.text, desController.text);
                    Navigator.pop(context);
                  }
                },
                color: darkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Create',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}