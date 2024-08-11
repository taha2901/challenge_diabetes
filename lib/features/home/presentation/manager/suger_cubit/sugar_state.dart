abstract class Sugarstate {}

class AddSugarLoading extends Sugarstate {}

class AddSugarSuccess extends Sugarstate {}

class AddSugarError extends Sugarstate {
  String errormessage;
  AddSugarError(this.errormessage);
}
