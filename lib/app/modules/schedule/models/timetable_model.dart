class TimetableModel {
  final String startTime;
  final String endTime;
  final String seg;
  final String ter;
  final String qua;
  final String qui;
  final String sex;
  final String sab;
  final String dom;

  TimetableModel(
      {this.startTime,
      this.endTime,
      this.seg,
      this.ter,
      this.qua,
      this.qui,
      this.sex,
      this.sab,
      this.dom});

  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'seg': seg,
      'ter': ter,
      'qua': qua,
      'qui': qui,
      'sex': sex,
      'sab': sab,
      'dom': dom,
    };
  }

  @override
  String toString() {
    return 'TimetableModel{startTime: $startTime,endTime: $endTime,seg: $seg,ter: $ter,qua: $qua,qui: $qui,sex: $sex,sab: $sab,dom: $dom}';
  }

  List toList() {
    return [startTime, endTime, seg, ter, qua, qui, sex, sab, dom];
  }
}
