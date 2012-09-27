describe "Parser", ->

  beforeEach ->
    @goodHTML = '<!DOCTYPE html><html><head><title>Title</title></head><body><p class="test">A test</p></body></html>'

  it "breaks up html into an array of tags", ->
    parser = new Parser @goodHTML
    expect(parser.stripTags()).toEqual ['<!DOCTYPE html>', '<html>', '<head>', '<title>', '</title>', '</head>', '<body>', '<p class="test">', '</p>', '</body>', '</html>']

