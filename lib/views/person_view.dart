import 'package:filter_listview_cubit/cubit/internet_cubit.dart';
import 'package:filter_listview_cubit/cubit/person_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonView extends StatefulWidget {
  const PersonView({super.key});

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> {
  late InternetCubit internetCubit;

  @override
  void initState() {
    super.initState();
    internetCubit = context.read<InternetCubit>();
    internetCubit.checkConnectivity();
    internetCubit.trackConnectivityChange();
  }

  @override
  void dispose() {
    super.dispose();
    context.read<PersonCubit>().onDispose();
    context.read<InternetCubit>().onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Persion")),
      body: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textFields(
              textController:
                  context.read<PersonCubit>().nameTextEditingController,
              lableText: "Name",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textFields(
              textController:
                  context.read<PersonCubit>().countryTextEditingController,
              lableText: "Country",
              icon: Icons.location_on,
            ),
          ),
          BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              return state.status == ConnectivityStatus.connected
                  ? Text("Connected with internet")
                  : Text("Not connected with internet");
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<PersonCubit>().addPerson();
            },
            child: Text("Add person"),
          ),

          Expanded(
            child: BlocBuilder<PersonCubit, PersonState>(
              builder: (context, state) {
                return state is PersonUpdatedState
                    ? ListView.builder(
                      itemCount: state.persons.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  context.read<PersonCubit>().removePerson(
                                    index: index,
                                  );
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                              title: Text(
                                state.persons[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(state.persons[index].address),
                            ),
                          ),
                        );
                      },
                    )
                    : Center(child: Text("No data found!"));
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget textFields({
  IconData icon = Icons.person,
  required TextEditingController textController,
  required String lableText,
}) {
  return TextField(
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    controller: textController,
    onChanged: (value) {},
    decoration: InputDecoration(
      label: Text(
        lableText,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      border: OutlineInputBorder(),
      prefixIcon: Icon(icon),
    ),
  );
}
