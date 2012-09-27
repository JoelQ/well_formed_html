class @Parser

  constructor: (@html)->

  stripTags: ->
    @html.match /<\/?[^>]+>/gi

  wellFormed: ->
    tags = @stripTags()
    stack = new Stack
    for tag in tags
      if @openingTag tag
        stack.push tag
      else if @closingTag tag
        if @matchingTags stack.viewTop(), tag
          stack.pop()
        else
          return false
    return true

  openingTag: (tag) ->
    tag.match(/<[^\/>]+>/) != null

  closingTag: (tag) ->
    tag.match(/<\/[^>]+>/) != null

  matchingTags: (openTag, closeTag) ->
    if @openingTag(openTag) and @closingTag(closeTag)
      return @tagName(openTag) == @tagName(closeTag)
    else
      return false

  tagName: (tag) ->
    tag.match(/[a-z]+(?=>|\s)/)[0]
