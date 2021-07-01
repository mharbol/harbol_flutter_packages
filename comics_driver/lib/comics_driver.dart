library comics_driver;

import 'package:web_regex/web_regex.dart';

// the ComicGetter class is bound to a specific website to get comics.
// A static ComicGetter will exist for all websites and will be pointed to
// when needed for comic retrieval
class ComicGetter {

  // then there are the regex start and end points that will go into the web_regex
  String regexStart;
  String regexEnd;
  String regexBody;

  // URL extension format for where to find the comic. Can use a good number of replacement tokens if needed
  String urlFormat;

  // static members for the urlFormat
  static const String COMIC_URL = '\$COMIC_URL_TOKEN';
  static const String YEAR = '\$YEAR4_TOKEN';
  static const String MONTH_NUMBER = '\$MONTH_TOKEN';
  static const String DATE_NUMBER = '\$DATE_TOKEN';

  // this will go in the place of the comic title and will be replaced whenever we call the ComicGetter
  // for a specific comic
  static const String COMIC_TITLE = '\$COMIC_TITLE_IN_URL_TOKEN';

  // constructor for the ComicGetter class. Uses named paramaters for readability 
  ComicGetter({required this.urlFormat,
               required this.regexStart, 
               required this.regexEnd, 
               this.regexBody = WebRegex.WILDCARD}){
                 
    // build the urlFormat by doing a lot of fancy replaces...
    // get the different components from the date to replace the tokens in urlFormat
    // var dateTimeNow = DateTime.now().toString();
  }
}