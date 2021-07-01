
import 'package:http/http.dart';

// class used to extract info from a website's HTML using regex in cool ways
class WebRegex {

  static const String WILDCARD = '.*';

  // the url to this specific page
  String url;

  // start and end of the RegEx for whatever we want to extract
  String regexStart = '';
  String regexEnd = '';

  // this denotes the RegEx for the body. We just use wildcard as a default
  String bodyRegex;

  // Constructor method for this WebRegex
  WebRegex({
    required this.url,
    required this.regexStart,
    required this.regexEnd, 
    this.bodyRegex = WILDCARD,
    });

  // private method to get website HTML body
  Future<String> _getSiteHTML() async {

    // get the HTML from the input URL
    var response = await get(Uri.parse(url));

    return response.body;
  }

  // find and extract the meat from the HTML using the regex
  Future<String> extract() async {

    // first get the html
    var html = await _getSiteHTML();

    // then look for the match in the html
    // build the regex to read from
    var exp = RegExp(regexStart + bodyRegex + regexEnd);

    // find all matches for that regex
    var matches = exp.allMatches(html);

    // use the first (hopefully only) match to make a substring and return after trimming the regexStart and regexEnd
    // here is how you would do it in many steps:
    /*

    // find the start and end of the full regex
    var start = matches.first.start;
    var end   = matches.first.end;

    // isolate just the base string as a substring (regex's will be literals in there)
    var baseString = html.substring(start, end);

    // use regex to eliminate the start and end regex by replacing with empty String
    baseString = baseString.replaceAllMapped(RegExp(regexStart), (match) => '');

    baseString = baseString.replaceAllMapped(RegExp(regexEnd), (match) => '');

    return baseString;
    */

    // here is the same thing all in one step:
    return html.substring(matches.first.start, matches.first.end)
      .replaceAllMapped(RegExp(regexStart), (match) => '')
      .replaceAllMapped(RegExp(regexEnd), (match) => '');
 
  }

}