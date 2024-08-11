import '../../../data/Sugarcheck.dart';

abstract class SugarCheckStates {} 
class SugarCheckinitial extends SugarCheckStates{}
class SugarCheckloading extends SugarCheckStates{}
class HaveData extends SugarCheckStates{
  List<double> beforemeal;
  List<double> aftermeal;
  List<Sugarcheck> sugardata;
  HaveData(this.beforemeal,this.aftermeal,this.sugardata);
}
class NothaveData extends SugarCheckStates{}
