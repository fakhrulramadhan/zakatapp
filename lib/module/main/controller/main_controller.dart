import 'package:example/core.dart';
import 'package:flutter/material.dart';

class MainController extends State<MainView> implements MvcController {
  static late MainController instance;
  late MainView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List randomAppItems = [
    // {
    //   "label": "Ionly UI",
    //   "view": const IonlyMainNavigationView(),
    // },
    // {
    //   "label": "Taras Migulko UI",
    //   "view": const TmIntroView(),
    // },
    // {
    //   "label": "Gojek",
    //   "view": const GjDashboardView(),
    // },
  ];

  List ficStateManagementList = [
    // {
    //   "label": "Counter",
    //   "view": const FicCounterView(),
    // },
    // {
    //   "label": "Loading",
    //   "view": const FicLoadingView(),
    // },
    // {
    //   "label": "Enabled or Disabled",
    //   "view": const FicEnableOrDisabledView(),
    // },
    // {
    //   "label": "Visiblity",
    //   "view": const FicVisibilityView(),
    // },
    // {
    //   "label": "Animation",
    //   "view": const FicAnimationView(),
    // },
    // {
    //   "label": "Navigation",
    //   "view": const FicNavigationView(),
    // },
    // {
    //   "label": "Cart",
    //   "view": const FicCartView(),
    // },
    // {
    //   "label": "Filter List",
    //   "view": const FicFilterListView(),
    // },
    // {
    //   "label": "Theme",
    //   "view": const FicThemeView(),
    // },
  ];

  List items = [
    // {
    //   "label": "Counter",
    //   "view": const TrsmCounterView(),
    // },
    // {
    //   "label": "Loading",
    //   "view": const TrsmLoadingView(),
    // },
    // {
    //   "label": "Visibility",
    //   "view": const TrsmVisibilityView(),
    // },
    // {
    //   "label": "Enabled/Disabled",
    //   "view": const TrsmEnabledAndDisabledView(),
    // },
    // {
    //   "label": "Cart",
    //   "view": const TrsmCartView(),
    // },
    // {
    //   "label": "Add & Delete",
    //   "view": const TrsmAddAndDeleteFromListView(),
    // },
    // {
    //   "label": "Loading for HTTP Request",
    //   "view": const TrsmLoadingForHttpRequestView(),
    // },
    // {
    //   "label": "Animation",
    //   "view": const TrsmAnimationView(),
    // },
    // {
    //   "label": "Animation by Mouse Event",
    //   "view": const TrsmAnimationByMouseEventView(),
    // },
    // {
    //   "label": "Slide Animation",
    //   "view": const TrsmSlideAnimationView(),
    // },
    // {
    //   "label": "Fade Animation",
    //   "view": const TrsmFadeAnimationView(),
    // },
    // {
    //   "label": "Scale Animation",
    //   "view": const TrsmScaleAnimationView(),
    // },
    // {
    //   "label": "Scale Animation by Slide Value",
    //   "view": const TrsmScaleAnimationBySlideValueView(),
    // },
    // {
    //   "label": "Rotate Animation",
    //   "view": const TrsmRotateAnimationView(),
    // },
    // {
    //   "label": "Fade In Animation",
    //   "view": const TrsmFadeInAnimationView(),
    // },
    // {
    //   "label": "Fade Out Animation",
    //   "view": const TrsmFadeOutAnimationView(),
    // },
    // {
    //   "label": "Scale In Animation",
    //   "view": const TrsmScaleInAnimationView(),
    // },
    // {
    //   "label": "Scale Out Animation",
    //   "view": const TrsmScaleOutAnimationView(),
    // },
    // {
    //   "label": "Digital Clock",
    //   "view": const TrsmDigitalClockView(),
    // },
    // {
    //   "label": "Horizontal List",
    //   "view": const TrsmHorizontalCategoryListView(),
    // },
    // {
    //   "label": "Vertical Category List",
    //   "view": const TrsmVerticalCategoryListView(),
    // },
    // {
    //   "label": "Category in Wrap",
    //   "view": const TrsmCategoryInWrapView(),
    // },
    // {
    //   "label": "Filter List",
    //   "view": const TrsmFilterListView(),
    // },
    // {
    //   "label": "Chat List",
    //   "view": const TrsmChatListView(),
    // },
    // {
    //   "label": "Navigation",
    //   "view": const TrsmNavigationView(),
    // },
    // {
    //   "label": "CRUD",
    //   "view": const TrsmCrudView(),
    // },
    // {
    //   "label": "Repeat Animation",
    //   "view": const LtsmRepeatAnimationView(),
    // },
    // {
    //   "label": "Navigation with Slide Animation",
    //   "view": const LtsmNavigationWithSlideAnimationView(),
    // },
    // {
    //   "label": "Scroll",
    //   "view": const LtsmScrollView(),
    // },
    // {
    //   "label": "Theme",
    //   "view": const LtsmThemeView(),
    // },
  ];

  List formItems = [
    // {
    //   "label": "Login",
    //   "view": const TrfmLoginFormView(),
    // },
    // {
    //   "label": "Signup",
    //   "view": const TrfmSignupFormView(),
    // },
    // {
    //   "label": "Forgot Password",
    //   "view": const TrfmForgotPasswordFormView(),
    // },
    // {
    //   "label": "Reset Password",
    //   "view": const TrfmResetPasswordFormView(),
    // },
    // {
    //   "label": "Edit Profile",
    //   "view": const TrfmEditProfileFormView(),
    // },
    // {
    //   "label": "Product Form",
    //   "view": const TrfmProductFormView(),
    // },
    // {
    //   "label": "Edit Store Form",
    //   "view": const TrfmEditStoreFormView(),
    // },
    // {
    //   "label": "Checkout Form",
    //   "view": const TrfmCheckoutFormView(),
    // },
    // {
    //   "label": "Review Form",
    //   "view": const TrfmReviewFormView(),
    // },
    // {
    //   "label": "Filter Date Dialog",
    //   "view": const TrfmFilterDateDialogFormView(),
    // },
    // {
    //   "label": "Filter Category & Date Bottomsheet",
    //   "view": const TrfmFilterCategoryAndDateBottomsheetFormView(),
    // },
  ];

  List httpRequestItems = [
    // {
    //   "label": "Login",
    //   "view": const HttpLoginView(),
    // },
    // {
    //   "label": "Product CRUD",
    //   "view": const HttpProductListView(),
    // },
  ];

  List firebaseExampleItems = [
    // {
    //   "label": "Register",
    //   "view": const TfRegisterView(),
    // },
    // {
    //   "label": "Login",
    //   "view": const TfLoginView(),
    // },
    // {
    //   "label": "Dashboard",
    //   "view": const TfDashboardView(),
    // },
    // {
    //   "label": "Profile",
    //   "view": const TfProfileView(),
    // },
    // {
    //   "label": "Product List",
    //   "view": const TfProductListView(),
    // },
    // {
    //   "label": "User List",
    //   "view": const TfUserListView(),
    // },
  ];

  List uiExampleItems = [
    // {
    //   "label": "Tiktok",
    //   "view": const TkMainNavigationView(),
    // },
    // {
    //   "label": "OVO",
    //   "view": const OvoDashboardView(),
    // },
  ];

  List localStorageItems = [
    // {
    //   "label": "Login",
    //   "view": const LsLoginView(),
    // },
    // {
    //   "label": "Theme",
    //   "view": const LsThemeView(),
    // },
    // {
    //   "label": "Product CRUD",
    //   "view": const LsProductListView(),
    // },
    // {
    //   "label": "Form History",
    //   "view": const LsFormHistoryView(),
    // },
  ];

  List stateManagementExerciseList = [
    // {
    //   "label": "Counter",
    //   "view": const LtsmCounterView(),
    // },
    // {
    //   "label": "Loading",
    //   "view": const LtsmLoadingView(),
    // },
    // {
    //   "label": "Visibility",
    //   "view": const LtsmVisibilityView(),
    // },
    // {
    //   "label": "Enabled or Disabled",
    //   "view": const LtsmEnabledOrDisabledView(),
    // },
    // {
    //   "label": "Slide Animation",
    //   "view": const LtsmSlideAnimationView(),
    // },
    // {
    //   "label": "Fade Animation",
    //   "view": const LtsmFadeAnimationView(),
    // },
    // {
    //   "label": "Rotate Animation",
    //   "view": const LtsmRotateAnimationView(),
    // },
    // {
    //   "label": "Horizontal Category List",
    //   "view": const LtsmHorizontalCategoryListView(),
    // },
    // {
    //   "label": "Vertical Category List",
    //   "view": const LtsmVerticalCategoryListView(),
    // },
    // {
    //   "label": "CRUD",
    //   "view": const LtsmCrudView(),
    // },
  ];

  List formExerciseList = [
    // {
    //   "label": "Login",
    //   "view": const LtfmLoginView(),
    // },
    // {
    //   "label": "Sign Up",
    //   "view": const LtfmSignUpView(),
    // },
    // {
    //   "label": "Reset Password",
    //   "view": const LtfmResetPasswordView(),
    // },
    // {
    //   "label": "Edit Profile",
    //   "view": const LtfmEditProfileView(),
    // },
    // {
    //   "label": "Product Form",
    //   "view": const LtfmProductFormView(),
    // },
    // {
    //   "label": "Review Form",
    //   "view": const LtfmReviewFormView(),
    // },
    // {
    //   "label": "Checkout Form",
    //   "view": const LtfmCheckoutFormView(),
    // },
    // {
    //   "label": "Filter Dialog Form",
    //   "view": const LtfmFilterDialogView(),
    // },
    // {
    //   "label": "Filter Bottom Sheet",
    //   "view": const LtfmFilterBottomSheetView(),
    // },
    // {
    //   "label": "Sliding Form",
    //   "view": const LtfmSlidingFormView(),
    // },
  ];

  List httpExerciseList = [
    // {
    //   "label": "Login",
    //   "view": const HtLoginView(),
    // },
    // {
    //   "label": "Product List",
    //   "view": const HtProductListView(),
    // },
    // {
    //   "label": "Dashboard",
    //   "view": const HtDashboardView(),
    // },
    // {
    //   "label": "Image Galleries",
    //   "view": const HtImageGalleriesView(),
    // },
    // {
    //   "label": "Statistic Card",
    //   "view": const HtStatisticCardView(),
    // },
    // {
    //   "label": "Line Chart",
    //   "view": const HtLineChartView(),
    // },
    // {
    //   "label": "Pie Chart",
    //   "view": const HtPieChartView(),
    // },
    // {
    //   "label": "Todolist",
    //   "view": const HtTodoListView(),
    // },
    // {
    //   "label": "Product CRUD",
    //   "view": const HtProductCrudListView(),
    // },
    // {
    //   "label": "Map Marker",
    //   "view": const HtMapMarkerView(),
    // },
  ];

  List lsExerciseList = [
    // {
    //   "label": "First Time Setup",
    //   "view": const LsFirstTimeSetupView(),
    // },
    // {
    //   "label": "Login Form with History",
    //   "view": const LsLoginFormWithHistoryView(),
    // },
    // {
    //   "label": "Login and Save Token",
    //   "view": const LsLoginAndSaveTokenView(),
    // },
    // {
    //   "label": "Create PIN",
    //   "view": const LsCreatePinView(),
    // },
    // {
    //   "label": "Login by PIN",
    //   "view": const LsLoginByPinView(),
    // },
    // {
    //   "label": "Customer CRUD",
    //   "view": const LsCustomerCrudView(),
    // },
    // {
    //   "label": "Product CRUD",
    //   "view": const LsProductCrudView(),
    // },
    // {
    //   "label": "POS",
    //   "view": const LsPosView(),
    // },
    // {
    //   "label": "POS with Table Selection",
    //   "view": const LsPosWithTableSelectionView(),
    // },
    // {
    //   "label": "Favorite",
    //   "view": const LsFavoriteView(),
    // },
    // {
    //   "label": "User Setting",
    //   "view": const LsUserSettingView(),
    // },
  ];

  List contextLessMenuItems = [
    // {
    //   "label": "Navigation",
    //   "view": const TcNavigationView(),
    // },
    // {
    //   "label": "Dialog",
    //   "view": const TcDialogView(),
    // },
    // {
    //   "label": "Bottom Sheeet",
    //   "view": const TcBottomSheetView(),
    // },
    // {
    //   "label": "Snackbar",
    //   "view": const TcSnackbarView(),
    // },
  ];
}
