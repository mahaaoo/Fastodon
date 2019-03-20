class Api {
  static String ServerList = 'https://instances.social/api/1.0/instances/list'; // 获取servrlist

  static String Apps = '/api/v1/apps'; // 注册app信息
  static String Token = '/oauth/token'; // 获取header Authorization
  static String VerifyToken = '/api/v1/apps/verify_credentials'; // 验证该header Authorization是否失效
  static String HomeTimeLine = '/api/v1/timelines/home'; // 首页时间线
  static String PublicTimeLine = '/api/v1/timelines/public'; // 跨域时间线
  static String LocalTimeLine = '/api/v1/timelines/public?local=true'; // 本站时间线
  static String OwnerAccount = '/api/v1/accounts/verify_credentials'; // 该账号的信息
  static String Notifications = '/api/v1/notifications'; // 获取用户的通知信息
  static String PushNewTooT = '/api/v1/statuses'; // 发送一个新文章
  static String Following(arg) {
    return '/api/v1/accounts/$arg/following';
  }  // 获取一个用户关注的用户
  static String Follower(arg) {
    return '/api/v1/accounts/$arg/followers';
  }  // 获取一个用户关注的用户
}
