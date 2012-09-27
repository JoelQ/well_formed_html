describe "Stack", ->

  beforeEach ->
    @stack = new Stack
    @stack.push 1
    @stack.push 2

  it "it can push objects onto stack", ->
    expect(@stack.count()).toEqual 2

  it "removeslast object from stack when popping", ->
    @stack.pop()
    expect(@stack.count()).toEqual 1

  it "returns last object in stack when popping", ->
    expect(@stack.pop()).toEqual 2

  it "resets itself", ->
    @stack.reset()
    expect(@stack.count()).toEqual 0

  it "returns the top item without popping", ->
    expect(@stack.viewTop()).toEqual 2
