import 'package:challenge_diabetes/core/widgets/custom_button.dart';
import 'package:challenge_diabetes/core/widgets/custom_show_toast.dart';
import 'package:challenge_diabetes/core/widgets/custom_text_field.dart';
import 'package:challenge_diabetes/features/appointments/presentation/manager/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:challenge_diabetes/features/appointments/presentation/manager/get_medicine_cubit/get_medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAppointments extends StatelessWidget {
  const AddAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var timesController = TextEditingController();
    var dosageController = TextEditingController();
    var dateController = TextEditingController();

    return BlocConsumer<AddMedicineCubit, AddMedicineState>(
      listener: (context, state) {
        if (state is AddMedicineSuccess) {
          showToast(
            msg: 'Added Successfully',
            state: ToastStates.SUCCESS,
          );
          GetMedicineCubit.get(context).getMedicines();
          Navigator.pop(context);
        } else if (state is AddMedicineFailure) {
          showToast(
            msg: 'Addition Failed: ${state.errMessage}',
            state: ToastStates.ERROR,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text('مواعيد الأدويه'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: nameController,
                      showBorder: false,
                      hint: 'الدواء',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: dosageController,
                                showBorder: false,
                                hint: 'الجرعه',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: timesController,
                                showBorder: false,
                                hint: 'الموعد',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: dateController,
                                showBorder: false,
                                hint: '10.0 pm',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    state is AddMedicineLoaded
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            text: 'إضافه',
                            icon: Icons.add,
                            color: Colors.black,
                            textcolor: Colors.white,
                            circular: 10,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                AddMedicineCubit.get(context).addMedicine(
                                  dosage: dosageController.text,
                                  name: nameController.text,
                                  date: dateController.text,
                                  times: timesController.text,
                                  context: context, // تمرير السياق هنا
                                );
                              }
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
