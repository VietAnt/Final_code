// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

//TodoCard
class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;

  //contructor
  const TodoCard({
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  });

  @override
  Widget build(BuildContext context) {
    final id = item['_id'] as String;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${index + 1}'),
        ),
        title: Text(item['title']),
        subtitle: Text(item['description']),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              //open edit page
              navigateEdit(item);
            } else if (value == 'delete') {
              //Delete and remote the items
              deleteById(id);
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Edit'),
                value: 'edit',
              ),
              const PopupMenuItem(
                child: Text('Delete'),
                value: 'delete',
              ),
            ];
          },
        ),
      ),
    );
  }
}
