import 'package:flutter/material.dart';
import 'Configurator.dart';

const List<String> _listA = ["o_ballon","a_with_a_tail","lamda","little_thunder","refueling_rocket","x_with_a_tail","c_inverted_with_a_dot"];
const List<String> _listB = ["e_inverted_with_two_dots","o_ballon","c_inverted_with_a_dot","cursive_ce","z_star_white","x_with_a_tail","z_inverted_question"];
const List<String> _listC = ["copyright","omega_arse","cursive_ce","x_with_an_i","r_outline","lamda","z_star_white"];
const List<String> _listD = ["flat_six","z_paragraph","b_with_a_t","refueling_rocket","x_with_an_i","z_inverted_question","smiley_face"];
const List<String> _listE = ["trident","smiley_face","b_with_a_t","c_with_a_dot","z_paragraph","snake_with_horns","z_star_black"];
const List<String> _listF = ["flat_six","e_inverted_with_two_dots","z_not_equal","a_with_e","trident","h_with_a_crown","omega"];

class KeypadsScreen extends StatefulWidget {
  final Configurator config;
  KeypadsScreen({Key key, @required this.config}) : super(key: key);
  @override
  _KeypadsScreenState createState() => new _KeypadsScreenState();
}

class _KeypadsScreenState extends State<KeypadsScreen> {
  String _partialPath = "'images/activities/Keypads/";
  Map<String,bool> _keysEligible = {
    "a_with_a_tail":true, "a_with_e":true, "b_with_a_t":true, "c_with_a_dot":true,
    "c_inverted_with_a_dot":true, "copyright":true, "cursive_ce":true,
    "e_inverted_with_two_dots":true, "flat_six":true, "h_with_a_crown":true,
    "lamda":true, "little_thunder":true, "o_ballon":true, "omega":true,
    "omega_arse":true,"r_outline":true, "refueling_rocket":true, "smiley_face":true,
    "snake_with_horns":true, "trident":true, "x_with_a_tail":true,
    "x_with_an_i":true,"z_inverted_question":true, "z_not_equal":true,
    "z_paragraph":true, "z_star_black":true,"z_star_white":true};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title:Text("Keypads"),
        ),
      body:
          Column(children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Text("Sequence: "),
              Image.asset(_partialPath+"0_blank"+".png")
            ],),
            Center(
              child: Text(
                'Number of keypads:  ' + _listF.length.toString()//_keysEligible.length.toString()
                ,
              ),
            )
          ],)
    );
  }
}
