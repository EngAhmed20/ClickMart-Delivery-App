class AppLinks{
  static const String serverLink="http://10.0.2.2/ecommerce/";
  static const String testLink="${serverLink}test.php";
  static const String loginLink="${serverLink}emp_auth/login.php";
  //======================forget pass==========================//
  static const String checkEmailLink="${serverLink}delivery/emp_auth/forgetpassword/checkemail.php";
  static const String verifyResetLink="${serverLink}delivery/emp_auth/forgetpassword/verifycode.php";
  static const String resetPasswordLink="${serverLink}delivery/emp_auth/forgetpassword/resetpassword.php";
  //======================root_home==========================//
  static const String homeLink="${serverLink}root_home.php";
  static const String HomeOrders="${serverLink}delivery/orders/view.php";
  static const String acceptDelivery="${serverLink}delivery/orders/approve.php";
  static const String completeDelivery="${serverLink}delivery/orders/done.php";
  static const String acceptedOrders="${serverLink}delivery/orders/accepted.php";
  static const orderDetailsLink="${serverLink}delivery/orders/delivery_details.php";
  static const String getArchiveData="${serverLink}delivery/orders/archive.php";

}