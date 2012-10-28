window.home = 

  init: ->
    @gallery = $('.gallery ul')
    @initSlider()
    @attachEventListeners()

  attachEventListeners: ->
    console.log 'attachEventListeners'

  initSlider: ->
    setTimeout =>
      setInterval $.proxy(@, 'slideLeft'), 5000
    , 5000

  slideLeft: ->
    images = @gallery.find 'li'
    $(images[0]).removeClass('prev').remove().appendTo @gallery
    $(images[1]).removeClass('left').addClass 'prev'
    $(images[2]).removeClass('current').addClass 'left'
    $(images[3]).removeClass('right').addClass 'current'
    $(images[4]).removeClass('next').addClass 'right'
    $(images[5]).addClass 'next'

    on

    