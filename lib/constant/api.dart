class Api {
  static String ServerList = 'https://instances.social/api/1.0/instances/list'; // 获取servrlist

  static String Apps = '/api/v1/apps'; // 注册app信息
  static String Token = '/oauth/token'; // 获取header Authorization
  static String VerifyToken = '/api/v1/apps/verify_credentials'; // 验证该header Authorization是否失效
  static String HomeTimeLine = '/api/v1/timelines/home'; // 首页时间线
  static String PublicTimeLine = '/api/v1/timelines/public'; // 跨域时间线
  static String LocalTimeLine = '/api/v1/timelines/public?local=true'; // 本站时间线
  static String OwnerAccount = '/api/v1/accounts/verify_credentials'; // 该账号的信息
}
