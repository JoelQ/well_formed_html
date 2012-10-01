class @Stack

  constructor: ->
    @reset()

  push: (obj) ->
    @content.push obj

  pop: ->
    @content.pop()

  viewTop: ->
    @content[@count() - 1]

  count: ->
    @content.length

  reset: ->
    @content = []

