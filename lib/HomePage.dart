import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isCross = true;
  String message;
  List<String> gameState;

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");


  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState=[
        "empty","empty","empty","empty","empty","empty","empty","empty","empty",
      ];
      this.message="";
    });
  }

  playGame(int index){
    if (this.gameState[index] == "empty") {
      setState((){
        if (this.isCross) {
          this.gameState[index] = "cross";
        }else{
          this.gameState[index] = 'circle';
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  checkWin(){
    if ((this.gameState[0] != 'empty')&&
       (this.gameState[0]== this.gameState[1])&&
       ( this.gameState[1]== this.gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
      }); 
    }
    else if ((this.gameState[3] != 'empty')&&
       (this.gameState[3]== this.gameState[4])&&
       ( this.gameState[4]== this.gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} wins';
      }); 
    }
    else if ((this.gameState[6] != 'empty')&&
       (this.gameState[6]== this.gameState[7])&&
       ( this.gameState[7]== this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} wins';
      }); 
    }
    else if ((this.gameState[0] != 'empty')&&
       (this.gameState[0]== this.gameState[3])&&
       ( this.gameState[3]== this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
      }); 
    }
    else if ((this.gameState[1] != 'empty')&&
       (this.gameState[1]== this.gameState[4])&&
       ( this.gameState[4]== this.gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} wins';
      }); 
    }
    else if ((this.gameState[2] != 'empty')&&
       (this.gameState[2]== this.gameState[5])&&
       ( this.gameState[5]== this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
      }); 
    }
    else if ((this.gameState[0] != 'empty')&&
       (this.gameState[0]== this.gameState[4])&&
       ( this.gameState[4]== this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
      }); 
    }
    else if ((this.gameState[2] != 'empty')&&
       (this.gameState[2]== this.gameState[4])&&
       ( this.gameState[4]== this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
      }); 
    }else if (!gameState.contains('empty')) {
      setState((){
        this.message = 'Game Draw';
      });
    }
  }

  reserGame(){
    setState(() {
      this.gameState=[
        "empty","empty","empty","empty","empty","empty","empty","empty","empty",
      ];
      this.message="";
    });
  }

  AssetImage getImage(String value){
    switch (value) {
      case ('empty'):
          return edit;
        break;
      case ('cross'):
          return cross;
        break;
      case ('circle'):
          return circle;
        break;
      default:
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i)=>SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: (){playGame(i);},
                  child: Image(
                    image: this.getImage(this.gameState[i])
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(this.message,
            style: TextStyle(fontSize: 20.0, 
            fontWeight: FontWeight.bold)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: MaterialButton(
              onPressed: (){
                this.reserGame();
              },
              // margin: EdgeInsets.only(bottom: 30.0), 
              color: Colors.pink,
              minWidth: 300.0,
              height: 50.0,
              child: Text('Reset Game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              )),
            ),
          ),
        ],
      ),
    );
  }
}