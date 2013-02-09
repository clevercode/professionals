window.answers = 

  init: ->
    $('.answer').first().addClass 'active'
    @attachEventListeners()

  attachEventListeners: ->
    $('.content').on 'click', '.answer h1', $.proxy @, 'onAnswerToggle'

  onAnswerToggle: (event) ->
    $answer = $(event.currentTarget).parent '.answer'
    $('.answer').not($answer).removeClass 'active'
    $answer.toggleClass 'active' unless $answer.hasClass 'active'

    