


import 'IndividualBar.dart';

class BarData{
  double? Firstday;
  double? secondday;
  double? thirsday;
  double? fourthday;
  double? fifthday;
  double? sixthday;
  double? sevenday;
  double? eightday;
  double? nineday;
  BarData({
    this.Firstday,
    this.secondday,
    this.thirsday,
    this.fourthday,
    this.fifthday,
    this.sixthday,
    this.sevenday,
    this.eightday,
    this.nineday
  });
  List<IndividualBar> bardata=[];
  void initializeBarData(){
    bardata=[
      IndividualBar(x: 0,y:Firstday),
      IndividualBar(x: 0,y:secondday),
      IndividualBar(x: 0,y:thirsday),
      IndividualBar(x: 0,y:fourthday),
      IndividualBar(x: 0,y:fifthday),
      IndividualBar(x: 0,y:sixthday),
      IndividualBar(x: 0,y:sevenday),
      IndividualBar(x: 0,y:eightday),
      IndividualBar(x: 0,y:nineday),
    ];
  }
}