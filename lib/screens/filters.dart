import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filter_provider.dart';

enum Filters { glutenfree, lactosefree, vegeterian, vegan }

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Yours Filter"),
        ),
        body: Column(
            children: [
              SwitchListTile(
                value: activeFilters[Filters.glutenfree]!,
                onChanged: (ischecked) {
                ref.read(filterProvider.notifier).setFilter(Filters.glutenfree, ischecked);
                },
                title: Text(
                  "Gluten_free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only include gluten-free meals.",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: activeFilters[Filters.lactosefree]!,
                onChanged: (ischecked) {
                ref.read(filterProvider.notifier).setFilter(Filters.lactosefree, ischecked);
                },
                title: Text(
                  "Lactose_free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only include Lactose-free meals.",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: activeFilters[Filters.vegeterian]!,
                onChanged: (ischecked) {
                ref.read(filterProvider.notifier).setFilter(Filters.vegeterian, ischecked);
                },
                title: Text(
                  "Vegeterian",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only include vegeterian meals.",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: activeFilters[Filters.vegan]!,
                onChanged: (ischecked) {
                ref.read(filterProvider.notifier).setFilter(Filters.vegan, ischecked);
                },
                title: Text(
                  "Vegan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only include Vegan meals.",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        
        );
  }
}
