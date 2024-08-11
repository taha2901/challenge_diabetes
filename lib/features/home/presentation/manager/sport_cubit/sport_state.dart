
abstract class SportState {} 
class AddWeightSuccess extends SportState{}
class AddWeightLoading extends SportState{}
class AddWeightError extends SportState{
  String errormessage;
  AddWeightError(this.errormessage);
}