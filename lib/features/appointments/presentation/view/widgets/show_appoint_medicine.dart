import 'package:challenge_diabetes/features/appointments/data/add_medicine_model.dart';
import 'package:challenge_diabetes/features/appointments/data/get_medicine_model/get_medicine_model.dart';
import 'package:challenge_diabetes/features/appointments/presentation/manager/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAppointMedicine extends StatelessWidget {
  const ShowAppointMedicine({
    super.key,
    this.medicineModel,
    this.addMedicineModel,
  });

  final GetMedicineModel? medicineModel;
  final AddMedicineModel? addMedicineModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMedicineCubit, AddMedicineState>(
      builder: (context, state) {
        return Card(
          color: const Color(0xffC8D2D8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        medicineModel!.name.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Row(
                        children: [
                          Text(medicineModel!.dosage.toString()),
                          const SizedBox(width: 1),
                          Text(medicineModel!.times.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      AddMedicineCubit.get(context).removeFromMedicine(
                        id: addMedicineModel!.id.toString(),
                      );
                    },
                    child: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
