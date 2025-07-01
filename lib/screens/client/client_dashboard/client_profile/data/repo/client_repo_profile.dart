


import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/screens/case_manager/profile/data/model/profile_employment_conditions_model.dart';
import 'package:endeavors/screens/case_manager/profile/data/model/profile_employment_goals_model.dart';

class ClientProfileRepo {

  Future<List<ProfileEmploymentConditionsModel>> fetchData()async{
    await Future.delayed(Duration(seconds: 1));

    return [
      ProfileEmploymentConditionsModel(svgImage: Assets.svg.alarmFill, title: 'Working Hours/Week', status: 'Negotiable', dataValue: '15 - 25 hrs'),
      ProfileEmploymentConditionsModel(svgImage: Assets.svg.clockLoader40, title: 'Hours/Shift', status: 'Negotiable', dataValue: '4 - 6 hrs'),
      ProfileEmploymentConditionsModel(svgImage: Assets.svg.eventBusy, title: 'Unavailable To Work On', status: 'Negotiable', dataValue: 'Sat (09:00 - 15:00) Sun (All Day)'),
      ProfileEmploymentConditionsModel(svgImage: Assets.svg.airportShuttle, title: 'Transportation', status: 'Non-Negotiable', dataValue: 'Car | 15mins |  2km'),
      ProfileEmploymentConditionsModel(svgImage: Assets.svg.apartment, title: 'Environment', status: 'Negotiable', dataValue: 'Quiet'),
      ProfileEmploymentConditionsModel(svgImage: Assets.svg.volunteerActivism, title: 'Support', status: 'Non-Negotiable', dataValue: 'N/A')
    ];
  }

  Future<List<ProfileEmploymentGoalsModel>> fetchEmploymentGoalData()async{
    await Future.delayed(Duration(seconds: 1));

    return [
      ProfileEmploymentGoalsModel(title: 'Attendance and Punctuality',
          summary: 'Within [specific timeframe], the worker will achieve consistent attendance and punctuality by arriving on time and adhering to their work schedule for at least [specific percentage, e.g., 95%] of their shifts, as monitored through supervisor feedback or timesheets.',
          achievementDate: '5th Day', isExpand: false),
      ProfileEmploymentGoalsModel(title: 'Workplace Adaptabilityy',
          summary: 'By [specific date], the worker will demonstrate adaptability in the workplace by effectively managing at least three changes in tasks, schedules, or procedures with minimal supervision, as evidenced by employer feedback or self-assessment.',
          achievementDate: '45th Day', isExpand: false),
      ProfileEmploymentGoalsModel(title: 'Conflict Resolution Skills',
          summary: 'Within [specific timeframe], the worker will achieve consistent attendance and punctuality by arriving on time and adhering to their work schedule for at least [specific percentage, e.g., 95%] of their shifts, as monitored through supervisor feedback or timesheets.',
          achievementDate: '15th Day', isExpand: false),

    ];
  }
}