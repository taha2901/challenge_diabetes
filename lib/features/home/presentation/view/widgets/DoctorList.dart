import 'package:challenge_diabetes/features/home/data/doctor_model/doctor_model.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/dooctor_cubit/doctor_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/view/widgets/DoctorDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        List<DoctorModel> doctors = [];

        if (state is DoctorsSuccessState) {
          doctors = state.doctorModels;
        } else if (state is DoctorFilteredState) {
          doctors = state.filteredDoctors;
        } else if (state is DoctorsErrorState) {
          return Center(child: Text(state.error));
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state is DoctorssLoadingState)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CircularProgressIndicator(),
              ),
            if (doctors.isEmpty && state is! DoctorssLoadingState)
              const Center(child: Text('No doctors available')),
            if (doctors.isNotEmpty)
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: DoctorDetails(
                        doctorId: doctors[index].id!.toInt(),
                        docDetails: doctors[index],
                      ),
                    );
                  },
                  itemCount: doctors.length,
                ),
              ),
          ],
        );
      },
    );
  }
}
