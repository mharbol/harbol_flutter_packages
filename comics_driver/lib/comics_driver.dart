library comics_driver;

import 'package:web_regex/web_regex.dart';



// the ComicGetter class is bound to a specific website to get comics.
// A static ComicGetter will exist for all websites and will be pointed to
// when needed for comic retrieval
class ComicGetter {

  static ComicGetter GO_COMICS_GETTER = ComicGetter(
      urlFormat: 'https://www.gocomics.com/' + COMIC_URL_TOKEN + '/2021/07/01', 
      regexStart: 'data-image=\\\"', 
      regexEnd: '\\\"'
    );

  // then there are the regex start and end points that will go into the web_regex
  String regexStart;
  String regexEnd;
  String regexBody;

  // URL extension format for where to find the comic. Can use a good number of replacement tokens if needed
  String urlFormat;

  // static members for the urlFormat
  static const String COMIC_URL_TOKEN = '\$COMIC_URL_TOKEN';
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

  Future<String> extractComic(String comicTitleURL) async {

    // make a WebRegex object with the comicTitleURL in the ComicGetter's urlFormat
    WebRegex wr = WebRegex(
      url: urlFormat.replaceAll(COMIC_URL_TOKEN, comicTitleURL), 
      regexStart: regexStart, 
      regexEnd: regexEnd
    );

    // use wr to extract the comic source
    String out = await wr.extract();

    // for debugging purposes, print to console
    print(out);

    // and finally return it
    return out;
  }
}