import '../../../data/Weightcheck.dart';

abstract class WeightCheckStates {} 
class WeightCheckinitial extends WeightCheckStates{}
class WeightCheckloading extends WeightCheckStates{}
class HaveData extends WeightCheckStates{
  List<int> weight;
  List<Weightcheck> weightdata;
  HaveData(this.weight,this.weightdata);
}
class NothaveData extends WeightCheckStates{}