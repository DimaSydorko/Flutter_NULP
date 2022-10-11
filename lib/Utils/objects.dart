class Subject {
  String name = '';
  String type = ''; //Lecture | Practice | Lab
  String teacher = '';
  String room = '';
  int start = 1;
  bool isAllGroup = true;
  bool isOnePerTwoWeeks = false;

  Subject(this.name, this.type, this.teacher, this.room, this.isAllGroup,
      this.isOnePerTwoWeeks, this.start);
}

class Day {
  String name = '';
  List<Subject> subjects = [];

  Day(this.name, this.subjects);
}
