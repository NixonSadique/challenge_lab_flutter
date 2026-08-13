
class AppConstants {
  AppConstants._();

  //Basic request needs
  static const String baseUrl = "http://127.0.0.1:8080/api/v1";
  static const accessTokenName = "accessToken";
  static const refreshTokenName = "refreshToken";

  // #Endpoints
  // Auth Endpoints
  static const loginEndpoint = 'auth/login';
  static const logoutEndpoint = 'auth/logout';
  static const refreshEndpoint = 'auth/refresh';
  static const registerEndpoint = 'auth/register';

  // User Endpoints
  static const meEndpoint = 'users/me';
  static const usersEndpoint = 'users';
  static const userByIdEndpoint = 'users/:id';
  static const userByIdentifierEndpoint = 'users/by-identifier';
  static const userByUsernameEndpoint = 'users/by-identifier/:username';
  static const userChallengesByIdentifierEndpoint = 'users/by-identifier/:identifier/challenges';

  // Challenge Endpoints
  static const challengesEndpoint = 'challenges';
  static const challengeByIdEndpoint = 'challenges/:id';
  static const challengeStatusEndpoint = 'challenges/:id/status';
  static const myChallengesEndpoint = 'challenges/me';
  static const challengeTeamsEndpoint = 'challenges/:challengeId/teams';
  static const challengeSubmissionsEndpoint = 'challenges/:challengeId/submissions';

  // Team Endpoints
  static const teamsEndpoint = 'teams';
  static const teamByIdEndpoint = 'teams/:id';
  static const joinTeamEndpoint = 'teams/:teamId/join';
  static const leaveTeamEndpoint = 'teams/:teamId/leave';
  static const teamSubmissionsEndpoint = 'teams/:teamId/submissions';
  static const teamMembersEndpoint = 'team-members';
  static const teamMembersByUserEndpoint = 'team-members/users/:userId';
  static const teamMembersByUsernameEndpoint = 'team-members/usernames/:username';
  static const teamMembersByTeamEndpoint = 'team-members/teams/:teamId';
  static const myTeamMembershipsEndpoint = 'team-members/me';

  // Submission Endpoints
  static const submissionsEndpoint = 'submissions';
  static const submissionByIdEndpoint = 'submissions/:id';
  static const mySubmissionsEndpoint = 'submissions/me';
  static const setWinnerEndpoint = 'submissions/:submissionId/winner';

  // Rating Endpoints
  static const ratingsEndpoint = 'ratings/submissions';
  static const ratingsBySubmissionEndpoint = 'ratings/submissions/:submissionId';
  static const ratingAverageEndpoint = 'ratings/submissions/:submissionId/average';

  // Admin Endpoints
  static const adminChallengesEndpoint = 'admin/challenges';
  static const adminUsersEndpoint = 'admin/users';
  static const adminStatsEndpoint = 'admin/stats';
}
