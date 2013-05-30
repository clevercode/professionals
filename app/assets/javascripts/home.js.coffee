window.home = 

  init: ->
    @gallery = $('.gallery ul')
    images = @gallery.find 'li'
    return if images.length < 6

    @initSlider()
    @attachEventListeners()

  attachEventListeners: ->
    $('.js-gallery-prev').on 'click', $.proxy @, 'slideRight'
    $('.js-gallery-next').on 'click', $.proxy @, 'slideLeft'

  initSlider: ->
    clearInterval @_timer
    setTimeout =>
      @_timer = setInterval $.proxy(@, 'slideLeft'), 5000
    , 5000

  slideLeft: ->
    images = @gallery.find 'li'
    $(images[0]).removeClass('prev').remove().appendTo @gallery
    $(images[1]).removeClass('left').addClass 'prev'
    $(images[2]).removeClass('current').addClass 'left'
    $(images[3]).removeClass('right').addClass 'current'
    $(images[4]).removeClass('next').addClass 'right'
    $(images[5]).addClass 'next'
    off

  slideRight: ->
    images = @gallery.find 'li'
    $(images[0]).removeClass('prev').addClass 'left'
    $(images[1]).removeClass('left').addClass 'current'
    $(images[2]).removeClass('current').addClass 'right'
    $(images[3]).removeClass('right').addClass 'next'
    $(images[4]).removeClass 'next'
    @gallery.find('li:last').remove().prependTo(@gallery).addClass 'prev'
    off
