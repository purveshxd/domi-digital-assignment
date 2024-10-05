import 'package:domi_labs_assignment/maps/cubit/maps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

class BottomDialog extends StatelessWidget {
  const BottomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        padding: const EdgeInsets.fromLTRB(30.0, 20, 30, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Invite & Earn",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    // dialogToggleFunc(false);
                    context.read<MapsCubit>().onBottomDialogClosed();
                    Navigator.of(context).pop();
                    FocusScope.of(context).unfocus();
                  },
                ),
              ],
            ),
            const Text(
              "Invite your neighbor and you both receive \$10 when they claim their address.",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Share.share(
                          'https://youtu.be/dQw4w9WgXcQ?si=444uH55mmF9zeAGC');
                    },
                    child: const Text(
                      "Send invite",
                      style: TextStyle(
                          height: 2.8,
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
