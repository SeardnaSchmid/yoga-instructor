import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_instructor/models/available_yoga_actions.dart';

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

  void _addPose() {
    setState(() {
      _poses.add(YogaPose(AvailableYogaActions.getAction("allFoursPose").id,
          duration: 10));
    });
  }

  void _removePose(int index) {
    setState(() {
      _poses.removeAt(index);
    });
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
                  'Poses',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _poses.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Pose ${index + 1}'),
                        subtitle:
                            Text('Duration: ${_poses[index].duration} seconds'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removePose(index),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: _addPose,
                  child: const Text('Add Pose'),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save the changes and navigate back to SessionOverviewScreen
                      final editedSession = Session(
                        id: widget.session.id,
                        name: _nameController.text,
                        description: _descriptionController.text,
                        poses: _poses,
                      );
                      sessionProvider.saveSession(editedSession);
                      Navigator.pop(context);
                    },
                    child: const Text('Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
