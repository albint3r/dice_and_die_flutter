import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';

class BodyWaitingRooms extends StatelessWidget {
  const BodyWaitingRooms({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WaitingRoomBloc>().state;
    if (state.isLoading) return Center(child: CircularProgressIndicator());
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Create Game'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('Item $index'),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
