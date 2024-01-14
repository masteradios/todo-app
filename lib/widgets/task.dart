class Task
{
  String task_title;
  bool isDone;
  Task({required this.task_title,this.isDone=false});

  void toggleCheckBox()
  {
    isDone=!isDone;
  }
}