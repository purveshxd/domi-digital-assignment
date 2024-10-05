import 'package:domi_labs_assignment/maps/cubit/maps_cubit.dart';
import 'package:domi_labs_assignment/widgets/custom_bottom_sheet.dart';
import 'package:domi_labs_assignment/widgets/floating_appbar.dart';
import 'package:domi_labs_assignment/widgets/map.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<MapsCubit>().loadMarker();
  }

  @override
  Widget build(BuildContext context) {
    // showSheet() {
    //   return const CustomBottomSheet();
    // }

    Widget hideShowDialog(MapsState state) {
      return state is! BottomDialogClosed
          ? const CustomBottomSheet()
          : const SizedBox();
    }

    return Scaffold(
      extendBody: true,
      body: BlocBuilder<MapsCubit, MapsState>(
        buildWhen: (previous, current) => current is! MapsActionState,
        builder: (context, state) {
          if (state is MapsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MapsLoadedSuccess) {
            return SafeArea(
                child: Stack(
              children: [
                MapView(polygons: state.polygon, marker: state.marker),
                const FloatingAppBar(),
                hideShowDialog(state)
              ],
            ));
          }
          if (state is MapsError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
