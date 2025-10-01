enum Environment { development, staging, qa, production }

class UrlConfig {
  static Environment environment = Environment.production;

  static const String STAGING_URL = String.fromEnvironment('DEV_BASE_URL');
  static const String PRODUCTION_URL = String.fromEnvironment('PROD_BASE_URL');

  static const String imageBaseUrl = String.fromEnvironment('IMAGE_BASE_URL');
  static const String FLAGS_BASE_URL = String.fromEnvironment('FLAGS_URL');
  static const String dojahTestAppId = String.fromEnvironment('DOJAH_APP_ID');
  static const String dojahTestPublicKey = String.fromEnvironment(
    'DOJAH_PUBLIC_KEY',
  );
  static const String facePlusTestApiKey = String.fromEnvironment(
    'FACE_PLUS_TEST_API_KEY',
  );
  static const String facePlusTestApiSecret = String.fromEnvironment(
    'FACE_PLUS_TEST_API_SECRET',
  );
  static const String messageUserEmail = String.fromEnvironment(
    'MESSAGE_USER_EMAIL',
  );
  static const String messageUserPassKey = String.fromEnvironment(
    'MESSAGE_USER_PASSKEY',
  );
  static const String supportNumber = String.fromEnvironment('SUPPORT_NUMBER');
  static const String supportEmail = String.fromEnvironment('SUPPORT_EMAIL');
  static const String flutterWavePublicTestKey = String.fromEnvironment(
    'FLUTTER_WAVE_TEST_KEY',
  );
  static const String flutterWaveSecretTestKey = String.fromEnvironment(
    'FLUTTER_WAVE_SECRET_TEST_KEY',
  );

  static const String flutterWavePublicLiveKey = String.fromEnvironment(
    'FLUTTER_WAVE_LIVE_KEY',
  );
  static const String flutterWaveSecretLiveKey = String.fromEnvironment(
    'FLUTTER_WAVE_SECRET_LIVE_KEY',
  );

  // static const String facePlusProdApiKey =
  //     String.fromEnvironment('FACE_PLUS_PROD_API_KEY');
  // static const String facePlusProdApiSecret =
  //     String.fromEnvironment('FACE_PLUS_PROD_API_SECRET');
  static final coreBaseUrl =
      environment == Environment.production ? PRODUCTION_URL : STAGING_URL;

  static final flutterWavePublicKey =
      environment == Environment.production
          ? flutterWavePublicLiveKey
          : flutterWavePublicTestKey;
  static final flutterWaveSecretKey =
      environment == Environment.production
          ? flutterWaveSecretLiveKey
          : flutterWaveSecretTestKey;

  static String getFlag(String path) =>
      '$FLAGS_BASE_URL${path.toUpperCase()}/shiny/64.png';
  static const String signIn = 'https://test.dayladexpo.com.ng/api/v1/users/login';
  static const String signUp = 'https://test.dayladexpo.com.ng/api/v1/users/signup';
  static const String google = 'https://test.dayladexpo.com.ng/api/v1/users/auth/google';
  static const String logout = 'https://test.dayladexpo.com.ng/api/v1/users/logout';
  static const String getdash =
      'https://test.dayladexpo.com.ng/api/v1/stats/users';
  static const String gettransactions =
      'https://test.dayladexpo.com.ng/api/v1/transactions';
  static const String giftcards =
      'https://test.dayladexpo.com.ng/api/v1/giftcards';
  static const String sellcards =
      'https://test.dayladexpo.com.ng/api/v1/transactions';
  static const String getbank =
      'https://test.dayladexpo.com.ng/api/v1/bankAccounts';



  static const String forgotpassword =
      'https://test.dayladexpo.com.ng/api/v1/users/forgotPassword';
  static const String resetpass =
      'https://test.dayladexpo.com.ng/api/v1/users/resetPassword/6fd58b6cb03ff92e4550086ec67dca228386607f3e8e242f2adb5faf4de0c5d4';

 static const String resendOtp =
      'https://api.vico.com/api/v1/users/resend_verification';








  ///
  static const editprofile="https://api.vico.com/api/v1/users/updateMe";
  static const profile="https://api.vico.com/api/v1/users/me";

  ///
  static const search="https://api.vico.com/api/v1/search";



  ///products
  static const String allproducts =
      'https://api.vico.com/api/v1/products?status=active';
  static const String singleproducts =
      'https://api.vico.com/api/v1/products/';
  static const String getvendor =
      'https://api.vico.com/api/v1/users?role=vendor';
  static const String getvendorproducts =
      'https://api.vico.com/api/v1/products';

  ///categories
  static const String allcategory = 'https://api.vico.com/api/v1/categories';
  static const String subcategory = 'https://api.vico.com/api/v1/products?status=active';
  static const String similarpro = 'https://api.vico.com/api/v1/products?status=active';
  static const String allsubcat =
      'https://api.vico.com/api/v1/subcategories';

  ///transactions
  static const String addcart = 'https://api.vico.com/api/v1/transactions';
  static const String getcart = 'https://api.vico.com/api/v1/transactions';
  static const String coupon = 'https://api.vico.com/api/v1/coupons/apply';
  static const String updatecart = 'https://api.vico.com/api/v1/transactions/item/';
  static const String removeItemcart =
      'https://api.vico.com/api/v1/transactions/item/';

  ///orders
  static const String allorders =
      'https://api.vico.com/api/v1/orders';
  static const String singleeorders =
      'https://api.vico.com/api/v1/orders/';
  static const String rate =
      'https://api.vico.com/api/v1/reviews';
  static const String updateOrder =
      'https://api.vico.com/api/v1/orders/items/';
  static const String verifyOrder =
      'https://api.vico.com/api/v1/orders/verify-payment/';

  ///favourite

static const likeitem="https://api.vico.com/api/v1/products/";
static const viewlikeitem="https://api.vico.com/api/v1/users/likes/my-likes";


///shipping address
static const shippingdetails="https://api.vico.com/api/v1/shipping-settings/active";
static const statebilling="https://api.vico.com/api/v1/shipping-settings/state-fees";
// static const pickupstation="https://api.vico.com/api/v1/shipping-settings/pickup-locations";
static const pickupstation="https://api.vico.com/api/v1/shipping-settings/pickup-locations";
static const crypto_pay="https://api.vico.com/api/v1/paymentOptions";
static const crypto_price="https://api.coingecko.com/api/v3/coins/markets?vs_currency=ngn&ids=";

///payorder
static const paycrypto="https://api.vico.com/api/v1/orders/crypto-checkout";
static const paytransfer="https://api.vico.com/api/v1/orders/checkout-session";
}
