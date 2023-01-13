class NavigationRoute {
  static const loginScreen = "/login";

  static const accountParam = "account";
  static const accountScreen = "/$accountParam";

  static const homeParam = "home";
  static const homeScreen = "/$homeParam";

  static const mainParam = "main";
  static const mainScreen = "/:$mainParam($accountParam|$homeParam)";
}
