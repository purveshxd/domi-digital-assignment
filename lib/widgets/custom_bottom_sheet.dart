import 'package:domi_labs_assignment/card/cubit/card_view_cubit.dart';
import 'package:domi_labs_assignment/widgets/docs_widget.dart';
import 'package:domi_labs_assignment/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final DraggableScrollableController _controller = DraggableScrollableController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateSize);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateSize);
    _controller.dispose();
    super.dispose();
  }

  _updateSize() {
    context.read<CardViewCubit>().updateSize(_controller.size);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardViewCubit, double>(
      builder: (context, size) {
        return DraggableScrollableSheet(
          controller: _controller,
          minChildSize: 0.1,
          maxChildSize: 1,
          initialChildSize: size,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.black,
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: const Column(
                        children: [
                          SizedBox(height: 32),
                          ImageWidget(),
                          DocsWidget()
                        ],
                      ),
                    ),
                  ),
                  IgnorePointer(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff4e4e4e),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
