class SubjectsModel {
  final String classPractice;
  final String classPracticeLocation;
  final String classTheoretical;
  final String classTheoreticalLocation;
  final String id;
  final String subject;

  SubjectsModel({this.classPractice, this.classPracticeLocation, this.classTheoretical, this.classTheoreticalLocation, this.id, this.subject});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'classTheoretical': classTheoretical,
      'classTheoreticalLocation': classTheoreticalLocation,
      'classPractice': classPractice,
      'classPracticeLocation': classPracticeLocation,
    };
  }
}