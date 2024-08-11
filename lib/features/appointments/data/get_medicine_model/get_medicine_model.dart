class GetMedicineModel {
	String? name;
	String? date;
	String? times;
	String? dosage;

	GetMedicineModel({this.name, this.date, this.times, this.dosage});

	factory GetMedicineModel.fromJson(Map<String, dynamic> json) {
		return GetMedicineModel(
			name: json['name'] as String?,
			date: json['date'] as String?,
			times: json['times'] as String?,
			dosage: json['dosage'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'name': name,
				'date': date,
				'times': times,
				'dosage': dosage,
			};
}
