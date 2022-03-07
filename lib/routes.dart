import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/components/app.dart';
import 'package:twe/main.dart';
import 'package:twe/pages/AccountTab/contact_page.dart';
import 'package:twe/pages/AccountTab/feedback_session_page.dart';
import 'package:twe/pages/AccountTab/hisory_page.dart';
import 'package:twe/pages/AccountTab/history_detail_page.dart';
import 'package:twe/pages/AccountTab/member_detail_page.dart';
import 'package:twe/pages/AccountTab/my_session_page.dart';
import 'package:twe/pages/AccountTab/nofication_page.dart';
import 'package:twe/pages/AccountTab/profile_page.dart';
import 'package:twe/pages/HomeTab/ranking_page.dart';
import 'package:twe/pages/HomeTab/suggest_session_page.dart';
import 'package:twe/pages/LoginPage/login_page.dart';
import 'package:twe/pages/LoginPage/sign_in.dart';
import 'package:twe/pages/SearchTab/booking_page.dart';
import 'package:twe/pages/SearchTab/coffee_detail_page.dart';
import 'package:twe/pages/SearchTab/create_session_page.dart';
import 'package:twe/pages/SearchTab/list_mentor_page.dart';
import 'package:twe/pages/SearchTab/llist_cafe_page.dart';
import 'package:twe/pages/SearchTab/mentor_detail_page.dart';
import 'package:twe/pages/SearchTab/session_detail_main_page.dart';
import 'package:twe/pages/SearchTab/successful_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/sign-in':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => App());
      case '/create-session':
        return MaterialPageRoute(builder: (_) => CreateSessionPage());
      case '/list-coffee':
        ScreenArguments argument = args as ScreenArguments;
        return MaterialPageRoute(
            builder: (_) => ListCoffeePage(
                  isCoffeeTab: argument.isTab,
                ));
      case '/coffee-detail':
        return MaterialPageRoute(
            builder: (_) => CoffeeDetailPage(
                  isCoffeeTab: false,
                  coffeeId: int.parse(
                    args.toString(),
                  ),
                ));
      case '/list-mentor':
        ScreenArguments argument = args as ScreenArguments;
        return MaterialPageRoute(
            builder: (_) => ListMentorPage(
                  isMentorTab: argument.isTab,
                ));
      case '/mentor-detail':
        return MaterialPageRoute(
            builder: (_) => MentorDetailPage(
                  mentorId: (args.toString()),
                ));
      case '/confirm-booking':
        return MaterialPageRoute(builder: (_) => BookingPage());
      case '/contact':
        return MaterialPageRoute(builder: (_) => Contact());
      case '/notification':
        return MaterialPageRoute(builder: (_) => NoficationPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/history':
        return MaterialPageRoute(builder: (_) => HistoryPage());
      case '/history-detail':
        return MaterialPageRoute(
            builder: (_) => HistoryDetailPage(
                  historyId: (args.toString()),
                ));
      case '/ranking':
        return MaterialPageRoute(builder: (_) => RankingPage());
      case '/suggest-session':
        return MaterialPageRoute(builder: (_) => SuggestSessionPage());
      case '/successful':
        return MaterialPageRoute(builder: (_) => SuccessfulPage());
      case '/session':
        return MaterialPageRoute(
            builder: (_) => SessionDetailMainPage(
                  isRequestTab: true,
                  sessionId: (args.toString()),
                ));
      case '/session-request':
        return MaterialPageRoute(
            builder: (_) => SessionDetailMainPage(
                  isRequestTab: true,
                  sessionId: (args.toString()),
                ));
      case '/my-session':
        return MaterialPageRoute(builder: (_) => MySessionPage());
      case '/member-detail':
        return MaterialPageRoute(builder: (_) => MemberDetailPage());
      case '/feedback-history':
        return MaterialPageRoute(
            builder: (_) => FeedbackSessionPage(
                  historyId: (args.toString()),
                ));
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class ScreenArguments {
  final bool isTab;

  ScreenArguments(this.isTab);
}
