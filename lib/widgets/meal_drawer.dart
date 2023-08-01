import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters.dart';
// import 'package:meal_app/screens/tab_screen.dart';

const defaultfilter = {
  Filters.glutenfree: false,
  Filters.lactosefree: false,
  Filters.vegeterian: false,
  Filters.vegan: false,
};

// void onpressevent(BuildContext context, Map<Filters, bool> selectedfilter) {
//   BlocProvider.of<FilterBloc>(context)
//       .add(OnTapEvent(selectedfilter: selectedfilter));
// }

class MealDrawer extends StatelessWidget {
  const MealDrawer({super.key});
  // final void Function(String identifier) onselectedScreen ;

  @override
  Widget build(context) {
    Map<Filters, bool> selectedfilters = defaultfilter;
    const identifier = 'filter';
    // onpressevent(context, selectedfilters);

    

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.8)
                  ])),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              // margin: EdgeInsets.fromLTRB(32, 32, 16, 32),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Cooking UP!",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 25),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.food_bank,
              size: 30,
            ),
            title: const Text(
              "Meals",
              style: TextStyle(color: Colors.white, fontSize: 21),
            ),
          ),
          // BlocConsumer<FilterBloc, FilterState>(
          //   listener: (context, state) {},
            // builder: (context, state) {
              // return
               ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  if (identifier == 'filter') {
                     await Navigator.push<Map<Filters, bool>>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterScreen(),
                      ),
                    );

                    
                  }
                },

                // }

                leading: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: const Text(
                  "Filters",
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
              ),
            // },
          // ),
        ],
      ),
    );
  }
}
