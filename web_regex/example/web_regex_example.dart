// This cool dude gets today's Calvin and Hobbes from gocomics.com

import 'package:web_regex/web_regex.dart';

void main() async {
  // initiate the sweeeeet WebRegex
  var webRegex = WebRegex(

    // URL for today's (30 June 2021) Calvin and Hobbes
    url: 'https://www.gocomics.com/calvinandhobbes/2021/06/30', 

    // be beginning of the "regex sandwich" which is the start of
    // the HTML showing the comic source
    regexStart: 'data-image=\\\"', 

    // end of the "regex sandwich"
    regexEnd: '\\\"'
    );

    // display the comic url
    print(await webRegex.extract());
}