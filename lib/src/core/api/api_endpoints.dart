class ApiEndpoints {
  // const ApiEndpoints._();
  static String baseUrl = 'http://13.238.159.224:3000/';

  static const String feeds = '/api/feed';
  static const String login = '/api/login';
  static const String resendOtp = '/api/resend-otp';
  static const String verifyOTP = '/api/verify';
  static const String updateProfile = '/api/user/profile/update';
  static const String editProfile = '/api/user/update';
  static const String updatePhoneNumber = '/api/user/phone-number';
  static const String verifyUpdatedPhoneNumber = '/api/user/verify-updated-otp';
  static const String userInfo = '/api/user/info';
  static const String createFeedPost = '/api/feed/createFeedPost';
  static const String editFeedPost = '/api/feed/createFeedPost';
  static const String getFeedPost = '/api/feed/recommended';
  static const String getComments = '/api/feed/comments';
  static const String addComment = '/api/feed/comment';
  static const String deleteComment = '/api/feed/comment';
  static const String editComment = '/api/feed/comment';
  static const String reactPost = '/api/feed/react';
  static const String feedUserPost = '/api/feed/user';
  static const String feedDeletePost = '/api/feed/';
  static const String feedReportPost = '/api/feed/report';
  static const String getReportList = '/api/feed/reports';
  static const String getAppliedJob = '/api/jobs/applied';
  static const String getAppliedRoom = '/api/v1/rooms/applied';
  static const String rateApp = '/api/user/feedback';
  static const String deleteAccount = '/api/user/delete';
  static const String chats = '/api/chats';
  static const String getChatUser = '/api/chats';
  static const String getChatSingleUser = '/api/chats/get-chat-user';

  static const String getRooms = 'api/v1/rooms';
  static const String createRoom = 'api/v1/rooms';
  static const String updateRoomStatus = 'api/v1/rooms/availability';
  static const String searchRooms = 'api/v1/rooms/search';

  static const String getJobs = 'api/jobs';
  static const String searchJobs = 'api/jobs/search';
  static const String categoryJob = 'api/jobs/category';
  static const String jobCategory = 'api/jobs/categories';
  static const String getJobDescription = 'api/jobs';
  static const String postJobs = 'api/jobs';
  static const String createJob = 'api/jobs';
  static const String updateJobStatus = 'api/jobs/availability';
  static const String refreshToken = 'api/user/refresh-token';


  // quiz started
  static String searchTags = 'search/autoSuggestion';
  static const String search = '/search';
  static const String getResult = '/search/getResult';

  static const String session = 'auth/session';
  static const String register = 'auth/register';
  static const String addToWishlist = '/wishlist/create';
  static const String allWishList = '/wishlist/all';
  static const String home = '/home';
  static const String examStart = '/exam/startExam';
  static const String enrollCourse = '/course/enroll';
  static const String coursesByUser = '/course/getEnrolledCoursesByUser';
  static const String courseDetails = 'course/details';
  static String submitExam = 'exam/submit';
  static String onBoarding = 'onboard/welcome';
  static String deleteWishlist = 'wishlist/remove';
  static String submitReview = 'exam/review';
  static String userProfile = 'user/profile';
}
