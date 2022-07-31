abstract class NewsStates {}

class NewsInitState extends NewsStates {}

class ChangeBottomNavBar extends NewsStates{}

class GetBusinessNewsLoading extends NewsStates{}

class GetBusinessNewsSuccess extends NewsStates{}

class GetBusinessNewsFailed extends NewsStates
{
  final String? error;
  GetBusinessNewsFailed(this.error);
}

//
class GetSportNewsLoading extends NewsStates{}

class GetSportNewsSuccess extends NewsStates{}

class GetSportNewsFailed extends NewsStates
{
  final String? error;
  GetSportNewsFailed(this.error);
}
//
class GetScienceNewsLoading extends NewsStates{}

class GetScienceNewsSuccess extends NewsStates{}

class GetScienceNewsFailed extends NewsStates
{
  final String? error;
  GetScienceNewsFailed(this.error);
}

class ChangeThemeMode extends NewsStates{}