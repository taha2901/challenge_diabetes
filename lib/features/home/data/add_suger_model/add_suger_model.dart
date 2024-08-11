import 'package:challenge_diabetes/features/home/data/add_suger_model/suger_data.dart';


class AddSugerModel {
	String? message;
	SugerData? suger;

	AddSugerModel({this.message, this.suger});

	factory AddSugerModel.fromJson(Map<String, dynamic> json) => AddSugerModel(
				message: json['message'] as String?,
				suger: json['data'] == null
						? null
						: SugerData.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': suger?.toJson(),
			};
}
