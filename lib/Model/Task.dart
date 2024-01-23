class Task {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  bool notification;
 
  

  Task({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    this.notification = false,
    
  });
}