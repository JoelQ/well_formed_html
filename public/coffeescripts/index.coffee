document.getElementById("validate").addEventListener 'click', ->
  html = document.getElementById("html-source").value
  parser = new Parser html
  console.log parser.wellFormed()
