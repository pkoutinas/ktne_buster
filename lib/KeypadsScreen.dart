import 'package:flutter/material.dart';
import 'Configurator.dart';

Set<String> _listA = new Set.from(["o_balloon","a_with_a_tail","lamda","little_thunder","refueling_rocket","x_with_a_tail","c_inverted_with_a_dot"]);
Set<String> _listB = new Set.from(["e_inverted_with_two_dots","o_balloon","c_inverted_with_a_dot","cursive_ce","z_star_white","x_with_a_tail","z_inverted_question"]);
Set<String> _listC = new Set.from(["copyright","omega_arse","cursive_ce","x_with_an_i","r_outline","lamda","z_star_white"]);
Set<String> _listD = new Set.from(["flat_six","z_paragraph","b_with_a_t","refueling_rocket","x_with_an_i","z_inverted_question","smiley_face"]);
Set<String> _listE = new Set.from(["trident","smiley_face","b_with_a_t","c_with_a_dot","z_paragraph","snake_with_horns","z_star_black"]);
Set<String> _listF = new Set.from(["flat_six","e_inverted_with_two_dots","z_not_equal","a_with_e","trident","h_with_a_crown","omega"]);
const String _partialPath = "images/activities/Keypads/";

class KeypadsScreen extends StatefulWidget {
  final Configurator config;
  KeypadsScreen({Key key, @required this.config}) : super(key: key);
  @override
  _KeypadsScreenState createState() => new _KeypadsScreenState();
}

class _KeypadsScreenState extends State<KeypadsScreen> {
  List<String> _finalSequence = new List<String>();
  List<String> _candidateList = new List<String>();
  Map<String,bool> _keysEligible = {
    "a_with_a_tail":true, "a_with_e":true, "b_with_a_t":true, "c_with_a_dot":true,
    "c_inverted_with_a_dot":true, "copyright":true, "cursive_ce":true,
    "e_inverted_with_two_dots":true, "flat_six":true, "h_with_a_crown":true,
    "lamda":true, "little_thunder":true, "o_balloon":true, "omega":true,
    "omega_arse":true,"r_outline":true, "refueling_rocket":true, "smiley_face":true,
    "snake_with_horns":true, "trident":true, "x_with_a_tail":true,
    "x_with_an_i":true,"z_inverted_question":true, "z_not_equal":true,
    "z_paragraph":true, "z_star_black":true,"z_star_white":true};

  void _toggleKey(int index){
      if(_candidateList.contains(_keysEligible.keys.elementAt(index))){
      _candidateList.remove(_keysEligible.keys.elementAt(index));
      _finalSequence=[];}
      else
        _candidateList.length<4?
        _candidateList.add(_keysEligible.keys.elementAt(index)):{};

      if(_candidateList.length==4){
        _listA.containsAll(_candidateList)?_finalSequence = _sortList( _listA.toList(),_candidateList):
        _listB.containsAll(_candidateList)?_finalSequence = _sortList( _listB.toList(),_candidateList):
        _listC.containsAll(_candidateList)?_finalSequence = _sortList( _listC.toList(),_candidateList):
        _listD.containsAll(_candidateList)?_finalSequence = _sortList( _listD.toList(),_candidateList):
        _listE.containsAll(_candidateList)?_finalSequence = _sortList( _listE.toList(),_candidateList):
        _listF.containsAll(_candidateList)?_finalSequence = _sortList( _listF.toList(),_candidateList):
        _finalSequence=[];
      }
        }

  void _refreshKeys(int index){
    List<String> _tempEligibleKeys = new List();
    if (_listA.containsAll(_candidateList)){_tempEligibleKeys.addAll(_listA);}
    if (_listB.containsAll(_candidateList)){_tempEligibleKeys.addAll(_listB);}
    if (_listC.containsAll(_candidateList)){_tempEligibleKeys.addAll(_listC);}
    if (_listD.containsAll(_candidateList)){_tempEligibleKeys.addAll(_listD);}
    if (_listE.containsAll(_candidateList)){_tempEligibleKeys.addAll(_listE);}
    if (_listF.containsAll(_candidateList)){_tempEligibleKeys.addAll(_listF);}

    for (int i=0; i<_keysEligible.length;i++){
      _tempEligibleKeys.contains(_keysEligible.keys.elementAt(i))
          ?_keysEligible[_keysEligible.keys.elementAt(i)] = true
          :_keysEligible[_keysEligible.keys.elementAt(i)] = false;
    }
  }

  List<String> _sortList(List<String> ref, List<String> lst){
    List<int> _order = new List();
    for (int i=0; i < lst.length;i++){
      _order.add(ref.indexOf(lst.elementAt(i)));
    }
    _order.sort();
    return  [ref.elementAt(_order.elementAt(0)),
             ref.elementAt(_order.elementAt(1)),
             ref.elementAt(_order.elementAt(2)),
             ref.elementAt(_order.elementAt(3))];
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Stack(
                children:[
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 3.0)),
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 5.0, left: 1.0, right:1.0),
                width: 80.0,
                child:
              Image.asset(_finalSequence == null || _finalSequence.length<4
                  ?"images/activities/Keypads/0_blank.png"
                  :_partialPath+_finalSequence.elementAt(0)+".png") //Default image if no solution found (yet!)
              ),
              Container(
                margin: EdgeInsets.only(left:60, top: 60),
                child:
              Text("1", style: TextStyle(color: Colors.black),),
               )
                ]),
              Stack(
                  children:[
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 3.0)),
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.only(top: 5.0, left: 1.0, right:1.0),
                        width: 80.0,
                        child:
                        Image.asset(_finalSequence == null || _finalSequence.length<4
                            ?_partialPath+"0_blank.png"
                            :_partialPath+_finalSequence.elementAt(1)+".png") //Default image if no solution found (yet!)
                    ),
                    Container(
                      margin: EdgeInsets.only(left:60, top: 60),
                      child:
                      Text("2", style: TextStyle(color: Colors.black),),
                    )
                  ]),
              Stack(
                  children:[
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 3.0)),
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.only(top: 5.0, left: 1.0, right:1.0),
                        width: 80.0,
                        child:
                        Image.asset(_finalSequence == null || _finalSequence.length<4
                            ?"images/activities/Keypads/0_blank.png"
                            :_partialPath+_finalSequence.elementAt(2)+".png") //Default image if no solution found (yet!)
                    ),
                    Container(
                      margin: EdgeInsets.only(left:60, top: 60),
                      child:
                      Text("3", style: TextStyle(color: Colors.black),),
                    )
                  ]),
              Stack(
                  children:[
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 3.0)),
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.only(top: 5.0, left: 1.0, right:1.0),
                        width: 80.0,
                        child:
                        Image.asset(_finalSequence == null || _finalSequence.length<4
                            ?"images/activities/Keypads/0_blank.png"
                            :_partialPath+_finalSequence.elementAt(3)+".png") //Default image if no solution found (yet!)
                    ),
                    Container(
                      margin: EdgeInsets.only(left:60, top: 60),
                      child:
                      Text("4", style: TextStyle(color: Colors.black),),
                    )
                  ]),
            ],),
            Divider(
              color: Colors.white,
              height: 15.0,
            ),
            Center(
              child: Text(
                'Selected all icons that you can see:'
              ),
            ),
            GridView.count(
              crossAxisCount: 5,
              shrinkWrap: true,
              children: List.generate(27, (index) {
                  return
                    Listener(
                        onPointerDown: (PointerDownEvent event) {
                          setState(() {
                            _toggleKey(index);
                            _refreshKeys(index);
                          });
                        },
                        child:
                        GridTile(
                    child:
                    Container(
                        width: 50.0,
                        decoration: BoxDecoration(border: Border.all(
                            color:_candidateList.contains(_keysEligible.keys.elementAt(index))?Colors.red:Colors.white,
                            width: 1),
                        ),
                        child:
                            Opacity(
                              opacity: _keysEligible.values.elementAt(index)?1:0.85,
                              child:
                        Image.asset(_partialPath+_keysEligible.keys.elementAt(index)+".png") //Default image if no solution found (yet!)
                    )))
                  )
                    ;}
            )),
            Container(
              padding: EdgeInsets.all(20.0),
              child:
              Text("Selection: "+_candidateList.length.toString()+"/4"),
            ),
              ],)
    );
  }
}
