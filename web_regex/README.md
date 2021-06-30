A library for Dart developers.

## Usage

A simple usage example:

```dart
void main() async {
  // initiate the sweeeeet WebRegex
  var webRegex = WebRegex(

    // URL for today's (30 June 2021) Calvin and Hobbes
    url: 'https://www.gocomics.com/calvinandhobbes/2021/06/30', 

    // the beginning of the "regex sandwich" which is the start of
    // the HTML showing the comic source
    regexStart: 'data-image=\\\"', 

    // end of the "regex sandwich"
    regexEnd: '\\\"'
    );

    // display the comic url
    print(await webRegex.extract());
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
