class @Parser

  constructor: (@html)->

  stripTags: ->
    @html.match /<\/?[^>]+>/gi
