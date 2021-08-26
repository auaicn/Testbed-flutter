import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  const MyFormValidation({Key key}) : super(key: key);

  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  final String _functionName = "Form Validation";

  // widget 의, 그중에 FormState dml 유일한 키값
  final _formKey = GlobalKey<FormState>();

  FocusNode _nameFocuseNode;
  final _nameEditingController = TextEditingController();

  @override
  void initState() {
    _nameFocuseNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameFocuseNode.dispose();
    _nameEditingController.dispose();
    super.dispose();
  }

  void _handleAppBarBackArrow() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_functionName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _handleAppBarBackArrow,
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "공백은 허용되지 않습니다";
                  }

                  // return "" 도 소용 없었던 것이, 아래 UI 가 확장되어버린다.
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      // valid
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('처리중')));
                    }
                  },
                  child: Text('제출하기'),
                ),
              ),
              TextField(
                controller: _nameEditingController,
                onChanged: (text) {
                  print(text);
                },
                focusNode: _nameFocuseNode,
                decoration: InputDecoration(
                  hintText: '이름을 입력해주세요',
                  labelText: '이름',
                  border: InputBorder.none,
                ),
                autofocus: true,
              ),
              TextButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(_nameFocuseNode);
                },
                child: Text('focus'),
              ),
              TextButton(
                onPressed: () {
                  print(_nameEditingController.text);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text(_nameEditingController.text));
                      });
                },
                child: Text('값 확인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
