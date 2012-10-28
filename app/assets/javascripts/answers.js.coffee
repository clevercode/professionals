window.answers = 

  init: ->
    @answers = $('article.answer')
    @answers.first().addClass 'active'
    @attachEventListeners()

  attachEventListeners: ->
    @answers.find('h1').on 'click', $.proxy @, 'onAnswerToggle'

  onAnswerToggle: (event) ->
    $answer = $(event.currentTarget).parent '.answer'
    @answers.not($answer).removeClass 'active'
    $answer.toggleClass 'active' unless $answer.hasClass 'active'

    