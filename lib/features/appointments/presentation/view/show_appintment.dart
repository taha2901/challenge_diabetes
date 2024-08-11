import 'package:challenge_diabetes/features/appointments/presentation/manager/get_medicine_cubit/get_medicine_cubit.dart';
import 'package:challenge_diabetes/features/appointments/presentation/view/add_appointments.dart';
import 'package:challenge_diabetes/features/appointments/presentation/view/widgets/show_appoint_medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAppointment extends StatelessWidget {
  const ShowAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMedicineCubit, GetMedicineState>(
      listener: (context, state) {
        if (state is GetMedicineLoaded) {
          const Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text('مواعيد الأدويه'),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddAppointments(),
                ),
              );
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'اليوم',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ShowAppointMedicine(
                        medicineModel:
                            GetMedicineCubit.get(context).medicine[index],
                      );
                    },
                    itemCount: GetMedicineCubit.get(context).medicine.length,
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
