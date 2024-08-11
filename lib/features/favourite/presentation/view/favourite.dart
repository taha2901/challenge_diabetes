import 'package:challenge_diabetes/features/favourite/presentation/manager/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FavouriteCubit, FavouriteState>(
        listener: (context, state) {
          if (state is RemoveFromFavoritesSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Deleted from Favourites'),
                backgroundColor: Colors.green,
              ),
            );
          } 
          if (state is RemoveFromFavoritesErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Deleted Failed'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FavLoadState) {
            return const Center(child: CircularProgressIndicator());
          }
          final cubitFav = FavouriteCubit.get(context).favoriteList;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
            child: SafeArea(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 7.5, horizontal: 12),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubitFav.length,
                      itemBuilder: (context, index) {
                        final favtItem = cubitFav[index].doctor;
                        if (favtItem == null) return Container(); // التعامل مع العناصر الفارغة
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const SizedBox(width: 7),
                              Image.network(
                                favtItem.photo.toString(),
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      favtItem.userName.toString(),
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      favtItem.doctorspecialization.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    MaterialButton(
                                      onPressed: () {
                                        FavouriteCubit.get(context).removeFromFavorites(doctorId: favtItem.id.toString());
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      color: Colors.blue,
                                      child: Text(
                                        "Remove".toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
