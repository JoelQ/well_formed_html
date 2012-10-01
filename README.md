# Well formed HTML

This inspiration for this project came in a recent interview where I was asked to describe how I would implement a script for determining if an html/xml document was well-formed. In my response I suggested that a stack-based implementation would be great for testing whether tags were properly nested.

## Usage

Using the parser if very easy.

1. Require `parser.js` and `stack.js`
2. Initialize a parser with the html 'parser = Parser.new("html_source_code")'
3. Make a call to the parser's `wellFormed()` method. This will return true of false

An example is available at `example/index.html`
