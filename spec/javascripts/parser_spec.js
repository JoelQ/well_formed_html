// Generated by CoffeeScript 1.3.3
(function() {

  describe("Parser", function() {
    var badHTML, goodHTML, parser;
    goodHTML = '<!DOCTYPE html><html><head><title>Title</title></head><body><p class="test">A test</p></body></html>';
    badHTML = '<!DOCTYPE html><html><head><title>Title</title></head><body><p class="test">A test</body></p></html>';
    parser = new Parser(goodHTML);
    it("breaks up html into an array of tags", function() {
      return expect(parser.stripTags()).toEqual(['<!DOCTYPE html>', '<html>', '<head>', '<title>', '</title>', '</head>', '<body>', '<p class="test">', '</p>', '</body>', '</html>']);
    });
    it("returns true if the string is well-formed", function() {
      return expect(parser.wellFormed()).toBe(true);
    });
    it("returns false if the string is not well-formed", function() {
      var badParser;
      badParser = new Parser(badHTML);
      return expect(badParser.wellFormed()).toBe(false);
    });
    describe("openingTag", function() {
      it("returns true for an opening tag", function() {
        return expect(parser.openingTag("<p>")).toBe(true);
      });
      it("returns false for a closing tag", function() {
        return expect(parser.openingTag("</p>")).toBe(false);
      });
      return it("returns false for any other string", function() {
        return expect(parser.openingTag("abcd1234")).toBe(false);
      });
    });
    describe("closingTag", function() {
      it("returns true for a closing tag", function() {
        return expect(parser.closingTag("</p>")).toBe(true);
      });
      it("returns false for an opening tag tag", function() {
        return expect(parser.closingTag("<p>")).toBe(false);
      });
      return it("returns false for any other string", function() {
        return expect(parser.closingTag("abcd1234")).toBe(false);
      });
    });
    describe("matchingTags", function() {
      it("returns true when tags match", function() {
        return expect(parser.matchingTags('<p>', '</p>')).toBe(true);
      });
      it("returns false when the tags do not match", function() {
        return expect(parser.matchingTags('<p>', '</b>')).toBe(false);
      });
      return it("returns false when passed non-tags", function() {
        return expect(parser.matchingTags('<p>', 'abcd')).toBe(false);
      });
    });
    return describe("tagName", function() {
      it("returns the name of an opening tag", function() {
        return expect(parser.tagName('<p>')).toBe('p');
      });
      it("returns the name of an opening with attribute tag", function() {
        return expect(parser.tagName('<p name="test">')).toBe('p');
      });
      return it("returns the name of a closing tag", function() {
        return expect(parser.tagName('</p>')).toBe('p');
      });
    });
  });

}).call(this);