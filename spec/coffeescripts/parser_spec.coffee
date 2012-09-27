describe "Parser", ->

  goodHTML = '<!DOCTYPE html><html><head><title>Title</title></head><body><p class="test">A test</p></body></html>'
  badHTML = '<!DOCTYPE html><html><head><title>Title</title></head><body><p class="test">A test</body></p></html>'
  parser = new Parser goodHTML

  it "breaks up html into an array of tags", ->
    expect(parser.stripTags()).toEqual ['<!DOCTYPE html>', '<html>', '<head>', '<title>', '</title>', '</head>', '<body>', '<p class="test">', '</p>', '</body>', '</html>']

  it "returns true if the string is well-formed", ->
    expect(parser.wellFormed()).toBe true

  it "returns false if the string is not well-formed", ->
    badParser = new Parser badHTML
    expect(badParser.wellFormed()).toBe false

  describe "openingTag", ->
    it "returns true for an opening tag", ->
      expect(parser.openingTag("<p>")).toBe true

    it "returns false for a closing tag", ->
      expect(parser.openingTag("</p>")).toBe false

    it "returns false for any other string", ->
      expect(parser.openingTag("abcd1234")).toBe false

  describe "closingTag", ->
    it "returns true for a closing tag", ->
      expect(parser.closingTag("</p>")).toBe true

    it "returns false for an opening tag tag", ->
      expect(parser.closingTag("<p>")).toBe false

    it "returns false for any other string", ->
      expect(parser.closingTag("abcd1234")).toBe false

  describe "matchingTags", ->
    it "returns true when tags match", ->
      expect(parser.matchingTags('<p>', '</p>')).toBe true

    it "returns false when the tags do not match", ->
      expect(parser.matchingTags('<p>', '</b>')).toBe false

    it "returns false when passed non-tags", ->
      expect(parser.matchingTags('<p>', 'abcd')).toBe false

  describe "tagName", ->

    it "returns the name of an opening tag", ->
      expect(parser.tagName('<p>')).toBe 'p'

    it "returns the name of an opening with attribute tag", ->
      expect(parser.tagName('<p name="test">')).toBe 'p'

    it "returns the name of a closing tag", ->
      expect(parser.tagName('</p>')).toBe 'p'
