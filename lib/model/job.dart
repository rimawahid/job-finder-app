class Job {
  String company;
  String logoUrl;
  bool isMark;
  String title;
  String location;
  String time;
  List<String> req;
  Job(this.company, this.logoUrl, this.isMark, this.title, this.location,
      this.time, this.req);
  static List<Job> generateJobs() {
    return [
      Job(
        'Google LLC', 
        'assets/images/google_logo.png', 
        false, 
        'Principle Product Design', 
        '417 Marion , New York\nUntied States', 
        'Full Time', 
        [
          'Creative with an eye for shape and colour',
          'Understand different materials and production method',
          'How technical, practical and scientific knowledge a',
          'Interested in the way people choose and use product']),
          Job(
        'Linked IN', 
        'assets/images/linkedin_logo.png', 
        true, 
        'Principle Product Design', 
        '417 Marion , New York\nUntied States', 
        'Full Time', 
        [
          'Creative with an eye for shape and colour',
          'Understand different materials and production method',
          'How technical, practical and scientific knowledge a',
          'Interested in the way people choose and use product']),
          Job(
        'Airbnb inc', 
        'assets/images/airbnb_logo.png', 
        false, 
        'Product Design', 
        '417 Marion , New York\nUntied States', 
        'Full Time', 
        [
          'Creative with an eye for shape and colour',
          'Understand different materials and production method',
          'How technical, practical and scientific knowledge a',
          'Interested in the way people choose and use product']),
          Job(
        'Google LLC', 
        'assets/images/google_logo.png', 
        false, 
        'Principle Product Design', 
        '417 Marion , New York\nUntied States', 
        'Full Time', 
        [
          'Creative with an eye for shape and colour',
          'Understand different materials and production method',
          'How technical, practical and scientific knowledge a',
          'Interested in the way people choose and use product'])
    ];
  }
}
