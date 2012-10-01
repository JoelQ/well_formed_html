# Well formed HTML

This inspiration for this project came in a recent interview where I was asked to describe how I would implement a script for determining if an html/xml document was well-formed. In my response I suggested that a stack-based implementation would be great for testing whether tags were properly nested.

## Usage

Using the parser if very easy.

1. Require `parser.js` and `stack.js`
2. Initialize a parser with the html 'parser = Parser.new("html_source_code")'
3. Make a call to the parser's `wellFormed()` method. This will return true of false

An example is available at `example/index.html`

### Known issue

The parser currently breaks when tags have attributes that contain `/` characters (such as the `src` attribute on an image)

## Contributing

This library is built in coffeescript and then compiled to javascript. It is tested using the Jasmine library.

1. Set up the `coffee` utility to watch the `coffeescripts` directory and compile into the `javascripts` directory.
2. Start the jasmine server by running `rake jasmine JASMINE_PORT=2222`
3. Start guard by running `guard`

You can now edit the coffeescript files and the specs will automatically run in the terminal. Alternatively you can check the specs in the browser at `localhost:2222`
