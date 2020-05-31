import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {











// FUNC>TIONING  < START >

  // VAR. INITIATE
  String oper='';
  String output='0';
  String _output='0';
  String _output2='';
  double n1=0.0;
  double n2=0.0;
  String operand='';
  int a=0;
  String Error='';
  String error='No 2 "."s';
  int i=0;
  var Color=Colors.white;
  var Color2=Colors.white;
  String result='';
  var Buttoncolor;

  ButtonPressed(String Buttontext) {
    // 'C'
    if (Buttontext == 'C') {
      _output2 = '';
      result = '';
      Color2 = Colors.white;
      Error = '';
      a = 0;
      Color = Colors.white;
      output = '0';
      _output = '0';
      n1 = 0.0;
      n2 = 0.0;
      operand = '';
      oper = '';
    }

    //  '+' \\ '-' \\ 'X' || '/'
    else if (Buttontext == '+' || Buttontext == '-' || Buttontext == 'X' ||
        Buttontext == '/') {

      if (operand.contains('')) {
        n1 = double.parse(output);
        operand = Buttontext;
        oper = Buttontext;
      }
    }

    // '.'
    else if (Buttontext == '.') {
      if (_output.contains('.')) {
        a++;
      }
      else {
        _output += Buttontext;
      }
    }
    else if (Buttontext == "=") {
      n2 = double.parse(_output2);
      if (operand == '+') {
        result = (n1 + n2).toString();
      }
      if (operand == '-') {
        result = (n1 - n2).toString();
      }
      if (operand == 'X') {
        result = (n1 * n2).toString();
      }
      if (operand == '/') {
        result = (n1 / n2).toString();
      }
      n1 = 0.0;
      n2 = 0.0;
      operand = '';
    }
    else{
      if(operand!=''){
        _output2+=Buttontext;
      }
      else{
        _output+=Buttontext;
      }
    }
    print(_output);
    setState(() {
      if(a==0){
        if(Buttontext=='='){
          Color2=Colors.blueAccent;
          output=double.parse(_output).toStringAsFixed(2);
        }
        else {
          Color2=Colors.white;
          result='';
          output = double.parse(_output).toStringAsFixed(2);
        }
      }
      else {
        Error=error;
        Color=Colors.yellow;
      }

    });
  }

// FUNCTIONING  < ENDS >



















  // BUTTON WIDGET  < START >

  Widget Button(String Buttontext,var ButtonColor){
    return Expanded(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
        ),
        color: ButtonColor,
        child: Text(Buttontext,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),),
        onPressed: (){
          ButtonPressed(Buttontext);
        },
      ),
    );
  }

  // BUTTON WIDGET   < ENDS >






  // FLUTTER BASIC WORK  < START >

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 24
              ),
                child: Text(output,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Opperator',style: TextStyle(color: Colors.green,fontSize: 30,fontWeight: FontWeight.bold),),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.green,width: 5)
                  ),
                    child: Text(oper,style: TextStyle(color: Colors.green,fontSize: 40,fontWeight: FontWeight.bold),)
                ),
              ],
            ),
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 24
                ),
                child: Text(_output2,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
            ),
            SizedBox(height: 5,),
            Divider(color: Colors.green,height: 0,indent: 0.0,endIndent: 0,thickness: 2,),
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 30
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Result',style: TextStyle(color: Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold),),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color2,width: 5),
                          borderRadius: BorderRadius.circular(40)

                        ),
                        child: Text(result,style: TextStyle(color: Color2,fontSize: 50,fontWeight: FontWeight.bold),)
                    ),
                  ],
                )
            ),
            Divider(color: Colors.blueAccent,height: 0,indent: 0.0,endIndent: 0,thickness: 2,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Color
              ),
                child: Text(Error,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),)
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Button('7',Colors.green),
                    SizedBox(width: 5,),
                    Button('8',Colors.green),
                    SizedBox(width: 5,),
                    Button('9',Colors.green),
                    SizedBox(width: 5,),
                    Button('/',Colors.orange),
                    SizedBox(width: 5,),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Button('4',Colors.green),
                    SizedBox(width: 5,),
                    Button('5',Colors.green),
                    SizedBox(width: 5,),
                    Button('6',Colors.green),
                    SizedBox(width: 5,),
                    Button('X',Colors.orange),
                    SizedBox(width: 5,),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Button('1',Colors.green),
                    SizedBox(width: 5,),
                    Button('2',Colors.green),
                    SizedBox(width: 5,),
                    Button('3',Colors.green),
                    SizedBox(width: 5,),
                    Button('-',Colors.orange),
                    SizedBox(width: 5,),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Button('.',Colors.green),
                    SizedBox(width: 5,),
                    Button('0',Colors.green),
                    SizedBox(width: 5,),
                    Button('00',Colors.green),
                    SizedBox(width: 5,),
                    Button('+',Colors.orange),
                    SizedBox(width: 5,),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Button('C',Colors.red),
                    SizedBox(width: 5,),
                    Button('=',Colors.blueAccent),
                    SizedBox(width: 5,),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

// FLUTTER BASIC WORK  < ENDS >