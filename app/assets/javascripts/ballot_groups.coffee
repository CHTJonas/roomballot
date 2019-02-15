window.onload = ->
  link = document.getElementById 'sharelink'
  button = document.getElementById 'copybutton'

  button.onclick = (e) ->
    link.select()
    if document.execCommand 'copy'
      this.innerHTML = "Link copied!";
      this.className = "btn btn-success";
      window.getSelection().removeAllRanges();
