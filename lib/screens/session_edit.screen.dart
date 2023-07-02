import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_instructor/models/available_yoga_actions.dart';

import '../models/yoga_action.dart';
import '../models/yoga_pose.dart';
import '../models/yoga_session.dart';
import '../session.provider.dart';

class SessionEditScreen extends StatefulWidget {
  final Session session;

  const SessionEditScreen({Key? key, required this.session}) : super(key: key);

  @override
  SessionEditScreenState createState() => SessionEditScreenState();
}

class SessionEditScreenState extends State<SessionEditScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  final List<YogaPose> _poses = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.session.name);
    _descriptionController =
        TextEditingController(text: widget.session.description);
    _poses.addAll(widget.session.poses);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addPose(YogaPose newPose) {
    setState(() {
      _poses.add(newPose);
    });
  }

  void _removePose(int index) {
    setState(() {
      _poses.removeAt(index);
    });
  }

  void _saveChanges(BuildContext context, SessionProvider sessionProvider) {
    final editedSession = Session(
      id: widget.session.id,
      name: _nameController.text,
      description: _descriptionController.text,
      poses: _poses,
    );
    sessionProvider.saveSession(editedSession);
    Navigator.pop(context);
  }

  Future<void> _showAddPoseBottomSheet(BuildContext context) async {
    final action = await showModalBottomSheet<YogaAction>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Pose',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: AvailableYogaActions.actions.length,
                  itemBuilder: (context, index) {
                    final action =
                        AvailableYogaActions.actions.values.toList()[index];
                    return ListTile(
                      title: Text(action.name),
                      leading: Image.asset(
                        action.image,
                        width: 40,
                        height: 40,
                      ),
                      onTap: () {
                        Navigator.pop(context, action);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (action != null) {
      final newPose = YogaPose(action.id, duration: 10);
      _addPose(newPose);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(
      builder: (context, sessionProvider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Session'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Session Details',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Session Poses:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ReorderableListView.builder(
                    itemCount: _poses.length,
                    itemBuilder: (context, index) {
                      final pose = _poses[index];
                      final action =
                          AvailableYogaActions.getAction(pose.actionId);
                      return Dismissible(
                        key: ValueKey(pose),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          _removePose(index);
                        },
                        child: ListTile(
                          title: Text(
                            'Pose ${index + 1} - ${action.name}',
                          ),
                          subtitle: Text('Duration: ${pose.duration} seconds'),
                          leading: const Icon(Icons.drag_handle),
                        ),
                      );
                    },
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final pose = _poses.removeAt(oldIndex);
                        _poses.insert(newIndex, pose);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => _showAddPoseBottomSheet(context),
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 16.0),
              FloatingActionButton(
                onPressed: () => _saveChanges(context, sessionProvider),
                backgroundColor: Colors.green,
                child:
                    const Icon(Icons.save), // Set the background color to green
              ),
            ],
          ),
        );
      },
    );
  }
}
