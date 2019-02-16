window.onload = ->
  galleryLnk = document.getElementById 'gallery-link'
  galleryImg = document.getElementById 'gallery-img'
  galleryCap = document.getElementById 'gallery-caption'
  smallImages = document.getElementById('smalls').getElementsByTagName 'img'
  for smallImage, i in smallImages
    smallImage.ord = i
    smallImage.onclick = (e) ->
      galleryLnk.attributes['href'].value = this.src
      galleryImg.src = this.src
      galleryCap.innerHTML = gon.captions[this.ord]
